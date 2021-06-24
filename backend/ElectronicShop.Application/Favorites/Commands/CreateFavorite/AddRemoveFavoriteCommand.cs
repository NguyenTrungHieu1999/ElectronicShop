using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Favorites.Services;
using MediatR;

namespace ElectronicShop.Application.Favorites.Commands.CreateFavorite
{
    public class AddRemoveFavoriteCommand : IRequest<ApiResult<int>>
    {
        public int ProductId { get; set; }
    }
    
    public class CreateFavoriteHandle: IRequestHandler<AddRemoveFavoriteCommand, ApiResult<int>>
    {
        private readonly IFavoriteService _service;

        public CreateFavoriteHandle(IFavoriteService service)
        {
            _service = service;
        }

        public async Task<ApiResult<int>> Handle(AddRemoveFavoriteCommand request, CancellationToken cancellationToken)
        {
            return await _service.AddOrRemoveAsync(request.ProductId);
        }
    }
}