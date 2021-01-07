using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Application.ProductPhotos.Models;

namespace ElectronicShop.Application.ProductPhotos.Services
{
    public interface IProductPhotoService
    {
        Task<ApiResult<string>> CreateProductPhoto(CreateProductPhotoCommand request);

        Task<ApiResult<string>> DeleteAsync(int id);

        Task<ApiResult<List<PhotoVm>>> GetByProductId(int productId);
    }
}