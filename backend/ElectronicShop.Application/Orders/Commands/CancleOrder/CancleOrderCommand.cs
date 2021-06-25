using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;

namespace ElectronicShop.Application.Orders.Commands.CancleOrder
{
    public class CancleOrderCommand : IRequest<ApiResult<string>>
    {
        public CancleOrderCommand(int orderId)
        {
            OrderId = orderId;
        }

        public int OrderId { get; }
    }
    
    public class CancleOrderHandle:IRequestHandler<CancleOrderCommand, ApiResult<string>>
    {
        private readonly IOrderService _orderService;

        public CancleOrderHandle(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<ApiResult<string>> Handle(CancleOrderCommand request, CancellationToken cancellationToken)
        {
            return await _orderService.CancleOrderAsync(request.OrderId);
        }
    }
}