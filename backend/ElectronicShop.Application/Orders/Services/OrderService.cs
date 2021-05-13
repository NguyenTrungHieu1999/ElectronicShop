using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ElectronicShop.Application.OrderDetails.Extensions;

namespace ElectronicShop.Application.Orders.Services
{
    public class OrderService : IOrderService
    {
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;
        private const int MaxOrderStatusId = 7;

        public OrderService(IMapper mapper, IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateOrderCommand command)
        {
            await using var transaction = await _context.Database.BeginTransactionAsync();
            // Tạo đơn hàng
            var order = _mapper.Map<Order>(command);
            order.CreatedDate = DateTime.Now;
            order.DeliveryDate = DateTime.Now.AddDays(7);
            order.StatusId = 1;
            var isAuth = _httpContextAccessor.HttpContext.User.Identity.IsAuthenticated;

            if (isAuth)
            {
                order.UserId = int.Parse(_httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            }

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };
            
            // Tạo thông tin cho chi tiết đơn hàng
            order.OrderDetails = new List<OrderDetail>();

            foreach (var detail in command.OrderDetails)
            {
                var orderDetail = new OrderDetail();
                
                orderDetail.Map(detail);
                order.OrderDetails.Add(orderDetail);
                
                // Cập nhật số lượng sản phẩm tồn sau khi đặt hàng thành công
                var product = await _context.Products.FindAsync(detail.ProductId);
                product.Inventory -= detail.Quantity;

                if (product.Inventory < 0)
                {
                    return await Task.FromResult(new ApiErrorResult<string>("Số lượng hàng ở kho không còn đủ."));
                }
                
                _context.Products.Update(product);
            }
            
            await _context.Orders.AddAsync(order);
            
            // Lưu thông tin
            try
            {
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm đơn hàng thành công."));
        }

        public async Task<ApiResult<string>> ChangeStatusAsync(int orderId)
        {
            var order = await _context.Orders.FindAsync(orderId);

            if(order.StatusId <= MaxOrderStatusId)
            {
                order.StatusId += 1;
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

            _context.Orders.Update(order);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Bạn đã cập nhật trạng thái thành " + orderStatus.Name));
        }

        public async Task<ApiResult<List<Order>>> GetAllAsync()
        {
            var orders = await _context.Orders
                .Include(x => x.OrderDetails)
                .Include(x => x.OrderStatusDetails)
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Order>>(orders));
        }

        public async Task<ApiResult<List<Order>>> GetOrderByUserIdAsync()
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var orders = await _context.Orders
                .Include(x => x.OrderDetails)
                .Include(x => x.OrderStatusDetails)
                .Where(x => x.UserId == int.Parse(userId))
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Order>>(orders));
        }

        public async Task<ApiResult<Order>> GetOrderByIdAsync(int orderId)
        {
            var order = await FindOrderByIdAsync(orderId);

            return await Task.FromResult(new ApiSuccessResult<Order>(order));
        }

        public async Task<ApiResult<Order>> MyOrderByIdAsync(int orderId)
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var order = await FindOrderByIdAsync(orderId);

            if (order.UserId.Equals(int.Parse(userId)))
            {
                return await Task.FromResult(new ApiSuccessResult<Order>(order));
            }
            
            return await Task.FromResult(new ApiErrorResult<Order>("Không tìm thấy đơn hàng."));
        }

        public async Task<ApiResult<string>> CancleOrderAsync(int orderId)
        {
            var order = await _context.Orders.FindAsync(orderId);

            order.StatusId = 8;
            
            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };
            
            _context.Update(order);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Đơn hàng đã được hủy."));
        }
        
        public async Task<ApiResult<string>> CancleMyOrderAsync(int orderId)
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var order = await _context.Orders.FindAsync(orderId);

            if (order.UserId.Equals(int.Parse(userId)))
            {
                order.StatusId = 8;
            
                // Tạo thông tin trạng thái của đơn hàng
                order.OrderStatusDetails = new List<OrderStatusDetail>()
                {
                    new OrderStatusDetail()
                    {
                        StatusId = order.StatusId,
                        CreatedDate = DateTime.Now
                    }
                };
            
                _context.Update(order);

                await _context.SaveChangesAsync();

                return await Task.FromResult(new ApiSuccessResult<string>("Đơn hàng đã được hủy."));
            }

            return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy đơn hàng."));
        }

        private async Task<Order> FindOrderByIdAsync(int orderId)
        {
            var order = await _context.Orders
                .Include(x => x.OrderDetails)
                .Include(x => x.OrderStatusDetails)
                .FirstAsync(x => x.Id == orderId);

            return order;
        }
    }
}
