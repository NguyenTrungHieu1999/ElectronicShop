using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Orders.Commands.CancelOrder
{
    public class CancelOrderCommand : IRequest<ApiResult<Order>>
    {
        public CancelOrderCommand(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }

    public class CancleOrderHandle : IRequestHandler<CancelOrderCommand, ApiResult<Order>>
    {
        private readonly IOrderService _orderService;

        public CancleOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<Order>> Handle(CancelOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CancelOrderAsync(request.OrderId);
        }
    }
}