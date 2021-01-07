using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Queries.GetAllOrder
{
    public class GetAllOrderQuery : IRequest<ApiResult<List<OrderVm>>>
    {
    }

    public class GetAllOrderHandle : IRequestHandler<GetAllOrderQuery, ApiResult<List<OrderVm>>>
    {
        private readonly IOrderService _orderService;

        public GetAllOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<List<OrderVm>>> Handle(GetAllOrderQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.GetAllAsync();
        }
    }
}
