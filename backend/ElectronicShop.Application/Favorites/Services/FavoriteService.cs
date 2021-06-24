using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Favorites.Services
{
    public class FavoriteService : IFavoriteService
    {
        private readonly int _userId;
        private readonly ElectronicShopDbContext _context;
        private readonly IStorageService _storageService;

        public FavoriteService(ElectronicShopDbContext context, IHttpContextAccessor httpContextAccessor,
            IStorageService storageService)
        {
            _context = context;
            _storageService = storageService;
            if (httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
            {
                _userId = int.Parse(httpContextAccessor.HttpContext.User
                    .FindFirst(ClaimTypes.NameIdentifier)
                    .Value);
            }
        }

        public async Task<ApiResult<int>> AddOrRemoveAsync(int productId)
        {
            var favorite = await _context.FavoriteProducts
                .Where(x => x.UserId == _userId && x.ProductId == productId)
                .SingleOrDefaultAsync();

            if (favorite is null)
            {
                await _context.AddAsync(new FavoriteProduct
                {
                    ProductId = productId,
                    UserId = _userId,
                    Status = true
                });
                await _context.SaveChangesAsync();
                return await Task.FromResult(new ApiSuccessResult<int>(10));
            }

            if (favorite.Status)
            {
                favorite.Status = false;
                _context.Update(favorite);
                await _context.SaveChangesAsync();
                return await Task.FromResult(new ApiSuccessResult<int>(20));
            }

            favorite.Status = true;
            _context.Update(favorite);
            await _context.SaveChangesAsync();
            return await Task.FromResult(new ApiSuccessResult<int>(10));
        }

        public async Task<ApiResult<List<Product>>> GetAllAsync()
        {
            var favorites = await _context.FavoriteProducts
                .Where(x => x.UserId == _userId && x.Status == true)
                .ToListAsync();
            var favoriteModels = new List<Product>();
            foreach (var item in favorites)
            {
                var product = await _context.Products
                    .Include(x => x.ProductPhotos)
                    .Where(x => x.Id == item.ProductId)
                    .SingleOrDefaultAsync();

                favoriteModels.Add(product);
            }

            // Tạo đường dẫn cho toàn bộ hình ảnh của sản phẩm
            foreach (var p in favoriteModels)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(favoriteModels));
        }

        public async Task<ApiResult<string>> CleanAsync()
        {
            var favorites = await _context.FavoriteProducts
                .Where(x => x.UserId == _userId && x.Status == true)
                .ToListAsync();

            foreach (var favorite in favorites)
            {
                favorite.Status = false;
                _context.Update(favorite);
            }

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Đã xóa tất cả sản phẩm yêu thích"));
        }
    }
}