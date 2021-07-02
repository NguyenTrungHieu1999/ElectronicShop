using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Commands.ChangeOrderStatus
{
    public class ChangeOrderStatusCommand : IRequest<ApiResult<Order>>
    {
        public int OrderId { get; set; }

        public ChangeOrderStatusCommand(int orderId)
        {
            OrderId = orderId;
        }
    }

    public class ChangeOrderStatusHandle : IRequestHandler<ChangeOrderStatusCommand, ApiResult<Order>>
    {
        private readonly IOrderService _orderService;

        public ChangeOrderStatusHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<Order>> Handle(ChangeOrderStatusCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.ChangeStatusAsync(request.OrderId);
        }
    }
}
