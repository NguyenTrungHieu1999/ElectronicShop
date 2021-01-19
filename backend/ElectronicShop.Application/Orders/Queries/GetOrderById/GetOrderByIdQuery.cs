using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Orders.Queries.GetOrderById
{
    public class GetOrderByIdQuery : IRequest<ApiResult<Order>>
    {
        public GetOrderByIdQuery(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; set; }
    }
    
    public class GetOrderByIdHandle:IRequestHandler<GetOrderByIdQuery, ApiResult<Order>>
    {
        private readonly IOrderService _orderService;

        public GetOrderByIdHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<Order>> Handle(GetOrderByIdQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.GetOrderByIdAsync(request.OrderId);
        }
    }
}