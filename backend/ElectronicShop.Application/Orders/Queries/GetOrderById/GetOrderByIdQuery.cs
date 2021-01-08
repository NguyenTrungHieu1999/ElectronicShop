using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;

namespace ElectronicShop.Application.Orders.Queries.GetOrderById
{
    public class GetOrderByIdQuery : IRequest<ApiResult<OrderVm>>
    {
        public GetOrderByIdQuery(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; set; }
    }
    
    public class GetOrderByIdHandle:IRequestHandler<GetOrderByIdQuery, ApiResult<OrderVm>>
    {
        private readonly IOrderService _orderService;

        public GetOrderByIdHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<OrderVm>> Handle(GetOrderByIdQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.GetOrderByIdAsync(request.OrderId);
        }
    }
}