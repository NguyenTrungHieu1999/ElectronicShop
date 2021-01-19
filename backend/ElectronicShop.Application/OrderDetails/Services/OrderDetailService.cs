using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.OrderDetails.Services
{
    public class OrderDetailService : IOrderDetailService
    {
        private readonly ElectronicShopDbContext _context;

        private readonly IMapper _mapper;

        public OrderDetailService(ElectronicShopDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<ApiResult<List<OrderDetail>>> GetOrderDetailByOrderIdAsync(int orderId)
        {
            var orderDetails = await _context.OrderDetails
                .Include(x => x.Product)
                .Where(x=>x.OrderId == orderId)
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<OrderDetail>>(orderDetails));
        }
    }
}