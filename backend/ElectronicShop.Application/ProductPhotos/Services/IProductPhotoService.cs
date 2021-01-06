using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;

namespace ElectronicShop.Application.ProductPhotos.Services
{
    public interface IProductPhotoService
    {
        Task<ApiResult<string>> CreateProductPhoto(CreateProductPhotoCommand request);

        Task<ApiResult<string>> DeleteAsync(int id);
    }
}