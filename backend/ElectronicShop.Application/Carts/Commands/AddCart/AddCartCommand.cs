using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Carts.Commands.AddCart
{
    public class AddCartCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }

    public class AddCartHandle : IRequestHandler<AddCartCommand, ApiResult<string>>
    {
        private readonly ICartService _service;

        public AddCartHandle(ICartService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(AddCartCommand request, CancellationToken cancellationToken)
        {
            return await _service.AddAsync(request);
        }
    }
}