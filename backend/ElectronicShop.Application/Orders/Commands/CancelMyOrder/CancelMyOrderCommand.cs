using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;

namespace ElectronicShop.Application.Orders.Commands.CancelMyOrder
{
    public class CancelMyOrderCommand : IRequest<ApiResult<string>>
    {
        public CancelMyOrderCommand(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }

    public class CancleMyOrderHandle : IRequestHandler<CancelMyOrderCommand, ApiResult<string>>
    {
        private readonly IOrderService _orderService;

        public CancleMyOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<string>> Handle(CancelMyOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CancelMyOrderAsync(request.OrderId);
        }
    }
}