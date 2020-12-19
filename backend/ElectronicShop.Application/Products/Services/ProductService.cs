using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Data.Entities;
using ElectronicShop.Infrastructure.FileImage;
using ElectronicShop.Utilities.Session;
using ElectronicShop.Utilities.SystemConstants;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Services
{
    public class ProductService : IProductService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;
        private readonly IStorageService _storageService;

        public ProductService(IRepositoryWrapper repository,
            IHttpContextAccessor httpContextAccessor, IMapper mapper, IStorageService storageService)
        {
            _repository = repository;
            _httpContextAccessor = httpContextAccessor;
            _mapper = mapper;
            _storageService = storageService;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateProductCommand request)
        {
            var currentUser = _httpContextAccessor.HttpContext.Session
                .GetComplexData<User>(Constants.CURRENTUSER);

            var product = _mapper.Map<Product>(request);

            product.CreatedDate = DateTime.Now;

            product.CreatedBy = currentUser.UserName;

            string path = _storageService.CreatePath(request.CategoryId, request.Name);

            try
            {
                product.ProductPhotos = new List<ProductPhoto>()
                {
                    new ProductPhoto()
                    {
                        IsDefault = true,
                        Url = await _storageService.SaveFile(path, request.ThumbnailImage)
                    }
                };

                await _repository.ProductRepository.CreateAsync(product);

                await _repository.SaveChangesAsync();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Lỗi khi thêm sản phẩm: {0}", ex.ToString());

                return new ApiErrorResult<string>("Thêm sản phẩm thất bại");
            }

            return new ApiSuccessResult<string>("Thêm sản phẩm thành công");
        }

        //public async Task<ApiResult<string>> UpdateAsync() { }
    }
}