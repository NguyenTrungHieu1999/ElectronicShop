using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Carts.Commands.RemoveCart
{
    public class RemoveCartCommand : IRequest<ApiResult<string>>
    {
    }

    public class RemoveCartHandle : IRequestHandler<RemoveCartCommand, ApiResult<string>>
    {
        private readonly ICartService _service;

        public RemoveCartHandle(ICartService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(RemoveCartCommand request, CancellationToken cancellationToken)
        {
            return await _service.RemoveAllCart();
        }
    }
}
