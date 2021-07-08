using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Commands.HasReceived
{
    public class HasReceivedCommand : IRequest<ApiResult<bool>>
    {
        public int OrderId { get; }

        public HasReceivedCommand(int orderId)
        {
            OrderId = orderId;
        }
    }

    public class HasReceivedHandle : IRequestHandler<HasReceivedCommand, ApiResult<bool>>
    {
        private readonly IOrderService _service;

        public HasReceivedHandle(IOrderService service)
        {
            _service = service;
        }

        public async Task<ApiResult<bool>> Handle(HasReceivedCommand request, CancellationToken cancellationToken)
        {
            return await _service.HasReceivedAsync(request.OrderId);
        }
    }
}
