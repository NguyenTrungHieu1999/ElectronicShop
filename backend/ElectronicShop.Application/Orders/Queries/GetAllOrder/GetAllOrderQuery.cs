using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Queries.GetAllOrder
{
    public class GetAllOrderQuery : IRequest<ApiResult<List<Order>>>
    {
    }

    public class GetAllOrderHandle : IRequestHandler<GetAllOrderQuery, ApiResult<List<Order>>>
    {
        private readonly IOrderService _orderService;

        public GetAllOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<List<Order>>> Handle(GetAllOrderQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.GetAllAsync();
        }
    }
}
