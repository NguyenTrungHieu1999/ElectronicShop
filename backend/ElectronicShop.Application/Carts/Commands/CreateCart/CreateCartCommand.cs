using ElectronicShop.Application.Carts.Models;
using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Carts.Commands.CreateCart
{
    public class CreateCartCommand : IRequest<ApiResult<string>>
    {
       public List<CartModel> CartModels { get; set; }
    }
    
    public class CreateCartHandle: IRequestHandler<CreateCartCommand, ApiResult<string>>
    {
        private readonly ICartService _service;

        public CreateCartHandle(ICartService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(CreateCartCommand request, CancellationToken cancellationToken)
        {
            return await _service.CreateAsync(request.CartModels);
        }
    }
}