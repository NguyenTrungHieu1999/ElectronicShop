using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;

namespace ElectronicShop.Application.ProductPhotos.Services
{
    public class ProductService : IProductPhotoService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IStorageService _storageService;

        public ProductService(IRepositoryWrapper repository, IStorageService storageService)
        {
            _repository = repository;
            _storageService = storageService;
        }

        public async Task<ApiResult<string>> CreateProductPhoto(CreateProductPhotoCommand request)
        {
            var product = await _repository.ProductRepository.FindByIdAsync(request.ProductId);

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);
            
            var photo = new ProductPhoto()
            {
                IsDefault = request.IsDefault,
                Url = await _storageService.SaveFile(path, request.ThumbnailImage)
            };

            await _repository.ProductPhotoRepository.CreateAsync(photo);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm hình ảnh thành công!"));
        }
    }
}