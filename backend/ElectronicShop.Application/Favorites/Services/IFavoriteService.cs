using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Favorites.Services
{
    public interface IFavoriteService
    {
        Task<ApiResult<int>> AddOrRemoveAsync(int productId);
        Task<ApiResult<string>> CleanAsync();
        Task<ApiResult<List<Product>>> GetAllAsync();
    }
}