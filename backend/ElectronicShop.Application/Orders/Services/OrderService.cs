using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Services
{
    public class OrderService : IOrderService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;
        private const int maxOrderStatusId = 7;

        public OrderService(IRepositoryWrapper repository, IMapper mapper, 
            IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
            _repository = repository;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateOrderCommand command)
        {
            // Tạo đơn hàng
            var order = _mapper.Map<Order>(command);
            order.CreatedDate = DateTime.Now;
            order.DeliveryDate = DateTime.Now.AddDays(7);
            order.StatusId = (int)(EOrderStatus.ORDERSUCCESS + 1);
            order.UserId = Int32.Parse(_httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };

            // Lưu thông tin
            await _repository.OrderRepository.CreateAsync(order);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm đơn hàng thành công."));
        }

        public async Task<ApiResult<string>> ChangeStatusAsync(int orderId)
        {
            var order = await _repository.OrderRepository.FindByIdAsync(orderId);

            if(order.StatusId <= maxOrderStatusId)
            {
                order.StatusId = order.StatusId + 1;
            }

            var orderStatus = await _context.OrderStatuses.FindAsync(order.StatusId);

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };

            _repository.OrderRepository.Update(order);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Bạn đã cập nhật trạng thái thành " + orderStatus.Name));
        }

        public async Task<ApiResult<List<OrderVm>>> GetAllAsync()
        {
            var orders = await _repository.OrderRepository.FindAllAsync();

            var result = _mapper.Map<List<OrderVm>>(orders);

            return await Task.FromResult(new ApiSuccessResult<List<OrderVm>>(result));
        }

        public async Task<ApiResult<List<OrderVm>>> GetOrderByUserId()
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var orders = await _repository.OrderRepository
                .FindByCondition(x => x.UserId == Int32.Parse(userId))
                .ToListAsync();

            var result = _mapper.Map<List<OrderVm>>(orders);

            return await Task.FromResult(new ApiSuccessResult<List<OrderVm>>(result));
        }
    }
}
