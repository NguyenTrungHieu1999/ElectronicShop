using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;

namespace ElectronicShop.Application.Orders.Commands.CancleMyOrder
{
    public class CancleMyOrderCommand : IRequest<ApiResult<string>>
    {
        public CancleMyOrderCommand(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }
    
    public class CancleMyOrderHandle : IRequestHandler<CancleMyOrderCommand, ApiResult<string>>
    {
        private readonly IOrderService _orderService;

        public CancleMyOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<string>> Handle(CancleMyOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CancleMyOrderAsync(request.OrderId);
        }
    }
}