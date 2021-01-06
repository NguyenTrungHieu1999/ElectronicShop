using System;
using System.IO;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;

namespace ElectronicShop.Application.ProductPhotos.Services
{
    public class ProductPhotoService : IProductPhotoService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IStorageService _storageService;

        public ProductPhotoService(IRepositoryWrapper repository, IStorageService storageService)
        {
            _repository = repository;
            _storageService = storageService;
        }

        public async Task<ApiResult<string>> CreateProductPhoto(CreateProductPhotoCommand request)
        {
            var product = await _repository.ProductRepository.FindByIdAsync(request.ProductId);

            if(product is null)
            {
                return new ApiErrorResult<string>("Không thể tìm thấy sản phẩm để thêm ảnh");
            }

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);

            try
            {
                foreach (var photo in request.ThumbnailImages)
                {
                    var productPhoto = new ProductPhoto()
                    {
                        ProductId = product.Id,
                        IsDefault = true,
                        Url = await _storageService.SaveFile(path, photo)
                    };   
                
                    await _repository.ProductPhotoRepository.CreateAsync(productPhoto);
                }

                await _repository.SaveChangesAsync();
            }
            catch (Exception e)
            {
                throw;
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm hình ảnh thành công!"));
        }

        public async Task<ApiResult<string>> DeleteAsync(int id)
        {
            var photo = await _repository.ProductPhotoRepository.FindByIdAsync(id);

            var product = await _repository.ProductRepository.FindByIdAsync(photo.ProductId);

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);
            
            var filePath = Path.Combine(path, photo.Url);

            await _storageService.DeleteFileAsync(filePath);

            _repository.ProductPhotoRepository.Delete(photo);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa hình ảnh thành công."));
        }
    }
}