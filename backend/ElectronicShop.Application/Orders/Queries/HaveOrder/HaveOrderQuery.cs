﻿using System;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.Orders.Queries.HaveOrder
{
    public class HaveOrderQuery : IRequest<ApiResult<bool>>
    {
        public HaveOrderQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }

    public class HaveOrderHandle : IRequestHandler<HaveOrderQuery, ApiResult<bool>>
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;

        public HaveOrderHandle(IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
            _httpContextAccessor = httpContextAccessor;
            _context = context;
        }

        public async Task<ApiResult<bool>> Handle(HaveOrderQuery request, CancellationToken cancellationToken)
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            // Tìm xem người mua có mua sản phẩm và thanh toán và thời gian hiện tại có lớn hơn hạn được đánh giá không
            var query = from o in _context.Orders
                where o.UserId.Equals(int.Parse(userId)) && o.StatusId.Equals(7) && o.DeliveryDate.AddDays(3).Date >= DateTime.Now.Date
                join d in _context.OrderDetails on o.Id equals d.OrderId
                where d.ProductId.Equals(request.ProductId)
                select new
                {
                    orders = o
                };

            if (query.Count() <= 0) return await Task.FromResult(new ApiErrorResult<bool>("false"));

            return await Task.FromResult(new ApiSuccessResult<bool>(true));
        }
    }
}