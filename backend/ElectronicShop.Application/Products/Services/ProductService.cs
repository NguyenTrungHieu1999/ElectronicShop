using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Infrastructure.FileImage;
using ElectronicShop.Utilities.Session;
using ElectronicShop.Utilities.SystemConstants;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElectronicShop.Application.Products.Models;
using Microsoft.EntityFrameworkCore;
using ElectronicShop.Application.Products.Queries.GetAllProduct;

namespace ElectronicShop.Application.Products.Services
{
    public class ProductService : IProductService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;
        private readonly IStorageService _storageService;
        private readonly ElectronicShopDbContext _context;

        public ProductService(IRepositoryWrapper repository,
            IHttpContextAccessor httpContextAccessor, IMapper mapper,
            IStorageService storageService,
            ElectronicShopDbContext context)
        {
            _repository = repository;
            _httpContextAccessor = httpContextAccessor;
            _mapper = mapper;
            _storageService = storageService;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateProductCommand request)
        {
            var currentUser = _httpContextAccessor.HttpContext.User.Identity.Name;

            var product = _mapper.Map<Product>(request);

            product.CreatedDate = DateTime.Now;

            product.CreatedBy = currentUser;

            product.Inventory = request.GoodsReceipt;

            string path = _storageService.CreateProductPath(request.CategoryId, request.Name);

            try
            {
                product.ProductPhotos = new List<ProductPhoto>();

                foreach (var i in request.ThumbnailImages)
                {
                    product.ProductPhotos.Add(
                        new ProductPhoto()
                        {
                            IsDefault = true,
                            Url = await _storageService.SaveFile(path, i)
                        });
                }

                await _repository.ProductRepository.CreateAsync(product);

                await _repository.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return new ApiErrorResult<string>("Thêm sản phẩm thất bại");
            }

            return new ApiSuccessResult<string>("Thêm sản phẩm thành công");
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateProductCommand update)
        {
            var product = await _repository.ProductRepository.FindByIdAsync(update.Id);

            if(product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm cần cập nhật"));
            }

            _storageService.ChangeNameFolder(product.Name, update.Name);

            var currentUser = _httpContextAccessor.HttpContext.User.Identity.Name;

            product.ModifiedBy = currentUser;

            _repository.ProductRepository.Update(product);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật sản phẩm thành công"));
        }

        public async Task<ApiResult<string>> DeleteAsync(int productId)
        {
            var product = await _repository.ProductRepository.FindByIdAsync(productId);

            if(product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm cần xóa"));
            }

            product.Status = ProductStatus.HIDDEN;

            _repository.ProductRepository.Update(product);

            await _repository.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa sản phẩm thành công"));
        }

        public async Task<ApiResult<ProductVm>> GetProductByIdAsync(int productId)
        {
            var product = await _context.Products
                .Include(x => x.ProductPhotos)
                .SingleOrDefaultAsync(x => x.Id == productId);

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<ProductVm>("Không tìm thấy sản phẩm"));
            }

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);

            var result = _mapper.Map<ProductVm>(product);

            foreach (var p in result.ProductPhotos)
            {
                p.Url = "https://localhost:5001/" + path + "/" + p.Url;
            }

            return await Task.FromResult(new ApiSuccessResult<ProductVm>(result));
        }

        public async Task<ApiResult<List<ProductVm>>> GetAllProductAsync(GetAllProductQuery request)
        {
            var products = await _context.Products
                .Include(x => x.ProductPhotos)
                .Where(x => x.Status != ProductStatus.HIDDEN)
                .ToListAsync();

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<ProductVm>>("Không tìm thấy sản phẩm"));
            }

            var result = _mapper.Map<List<ProductVm>>(products);

            foreach (var p in result)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<ProductVm>>(result));
        }
    }
}