using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Queries.GetOrderByUserId
{
    public class GetOrderByUserIdQuery : IRequest<ApiResult<List<List<OrderVm>>>>
    {
    }

    public class GetOrderByUserIdHandle : IRequestHandler<GetOrderByUserIdQuery, ApiResult<List<List<OrderVm>>>>
    {
        private readonly IOrderService _orderService;

        public GetOrderByUserIdHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<List<List<OrderVm>>>> Handle(GetOrderByUserIdQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.GetOrderByUserIdAsync();
        }
    }
}
