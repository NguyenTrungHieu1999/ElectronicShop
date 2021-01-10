using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto;
using ElectronicShop.Application.ProductPhotos.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.ProductPhotos.Services
{
    public class ProductPhotoService : IProductPhotoService
    {
        private readonly IStorageService _storageService;
        private readonly ElectronicShopDbContext _context;
        private readonly IMapper _mapper;

        public ProductPhotoService(IStorageService storageService, IMapper mapper, ElectronicShopDbContext context)
        {
            _storageService = storageService;
            _mapper = mapper;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateProductPhoto(CreateProductPhotoCommand request)
        {
            var product = await _context.Products.FindAsync(request.ProductId);

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
                
                    await _context.ProductPhotos.AddAsync(productPhoto);
                }

                await _context.SaveChangesAsync();
            }
            catch (Exception e)
            {
                throw;
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm hình ảnh thành công!"));
        }

        public async Task<ApiResult<string>> DeleteAsync(int id)
        {
            var photo = await _context.ProductPhotos.FindAsync(id);

            var product = await _context.Products.FindAsync(photo.ProductId);

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);
            
            var filePath = Path.Combine(path, photo.Url);

            await _storageService.DeleteFileAsync(filePath);

            _context.ProductPhotos.Remove(photo);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa hình ảnh thành công."));
        }
       
        public async Task<ApiResult<List<PhotoVm>>> GetByProductId(int productId)
        {
            var photos = await _context.ProductPhotos
                .Where(x => x.ProductId == productId)
                .ToListAsync();

            var product = await _context.Products.FindAsync(productId);

            var result = _mapper.Map<List<PhotoVm>>(photos);

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);

            for (int i = 0; i < photos.Count; i++)
            {
                result[i].Url = "https://localhost:5001/" + path + "/" + photos[i].Url;
            }

            return await Task.FromResult(new ApiSuccessResult<List<PhotoVm>>(result));
        }
    }
}