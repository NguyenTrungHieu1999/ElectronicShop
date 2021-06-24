using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Favorites.Services;

namespace ElectronicShop.Application.Favorites.Queries.GetAllFavorite
{
    public class GetAllFavoriteByUserIdQuery : IRequest<ApiResult<List<Product>>>
    {
    }

    public class GetAllFavoriteByUserIdHandle : IRequestHandler<GetAllFavoriteByUserIdQuery, ApiResult<List<Product>>>
    {
        private readonly IFavoriteService _service;

        public GetAllFavoriteByUserIdHandle(IFavoriteService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<Product>>> Handle(GetAllFavoriteByUserIdQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetAllAsync();
        }
    }
}
