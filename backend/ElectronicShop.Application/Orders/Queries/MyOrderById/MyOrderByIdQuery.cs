using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Orders.Queries.MyOrderById
{
    public class MyOrderByIdQuery : IRequest<ApiResult<Order>>
    {
        public MyOrderByIdQuery(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }

    public class MyOrderByIdHandle : IRequestHandler<MyOrderByIdQuery, ApiResult<Order>>
    {
        private readonly IOrderService _orderService;

        public MyOrderByIdHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<Order>> Handle(MyOrderByIdQuery request, CancellationToken cancellationToken)
        {
            return await _orderService.MyOrderByIdAsync(request.OrderId);
        }
    }
}