using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Commands.ChangeOrderStatus
{
    public class ChangeOrderStatusCommand : IRequest<ApiResult<string>>
    {
        public int OrderId { get; set; }

        public ChangeOrderStatusCommand(int orderId)
        {
            OrderId = orderId;
        }
    }

    public class ChangeOrderStatusHandle : IRequestHandler<ChangeOrderStatusCommand, ApiResult<string>>
    {
        private readonly IOrderService _orderService;

        public ChangeOrderStatusHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<string>> Handle(ChangeOrderStatusCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.ChangeStatusAsync(request.OrderId);
        }
    }
}
