using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Models;
using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Carts.Queries.GetAllCartByUserId
{
    public class GetAllCartByUserIdQuery : IRequest<ApiResult<List<CartVm>>>
    { }

    public class GetAllCartByUserIdHandle : IRequestHandler<GetAllCartByUserIdQuery, ApiResult<List<CartVm>>>
    {
        private readonly ICartService _cartService;

        public GetAllCartByUserIdHandle(ICartService cartService)
        {
            _cartService = cartService;
        }

        public async Task<ApiResult<List<CartVm>>> Handle(GetAllCartByUserIdQuery request, CancellationToken cancellationToken)
        {
            return await _cartService.GetAllAsync();
        }
    }
}