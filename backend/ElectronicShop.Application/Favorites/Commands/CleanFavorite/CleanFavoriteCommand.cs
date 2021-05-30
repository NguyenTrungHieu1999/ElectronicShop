using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Favorites.Services;
using MediatR;

namespace ElectronicShop.Application.Favorites.Commands.CleanFavorite
{
    public class CleanFavoriteCommand : IRequest<ApiResult<string>>
    {
    }

    public class CleanFavoriteHandle : IRequestHandler<CleanFavoriteCommand, ApiResult<string>>
    {
        private readonly IFavoriteService _service;

        public CleanFavoriteHandle(IFavoriteService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(CleanFavoriteCommand request, CancellationToken cancellationToken)
        {
            return await _service.CleanAsync();
        }
    }
}