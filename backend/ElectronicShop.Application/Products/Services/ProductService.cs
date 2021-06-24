using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Application.Products.Extensions;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Infrastructure.FileImage;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElectronicShop.Application.Products.Queries.FilterProduct;

namespace ElectronicShop.Application.Products.Services
{
    public class ProductService : IProductService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;
        private readonly IStorageService _storageService;
        private readonly ElectronicShopDbContext _context;

        public ProductService(
            IHttpContextAccessor httpContextAccessor, IMapper mapper,
            IStorageService storageService,
            ElectronicShopDbContext context)
        {
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

                await _context.Products.AddAsync(product);

                await _context.SaveChangesAsync();
            }
            catch
            {
                return new ApiErrorResult<string>("Thêm sản phẩm thất bại");
            }

            return new ApiSuccessResult<string>("Thêm sản phẩm thành công");
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateProductCommand update)
        {
            var product = await _context.Products.FindAsync(update.Id);

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm cần cập nhật"));
            }

            string spath = _storageService.CreateProductPath(product.CategoryId, product.Name);

            string dpath = _storageService.CreateProductPath(product.CategoryId, update.Name);

            _storageService.ChangeNameFolder(spath, dpath);

            product.Map(update);

            var currentUser = _httpContextAccessor.HttpContext.User.Identity.Name;

            product.ModifiedBy = currentUser;

            _context.Products.Update(product);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật sản phẩm thành công"));
        }

        public async Task<ApiResult<string>> DeleteAsync(int productId)
        {
            var product = await _context.Products.FindAsync(productId);

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm cần xóa"));
            }

            product.Status = ProductStatus.HIDDEN;

            _context.Products.Update(product);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa sản phẩm thành công"));
        }

        public async Task<ApiResult<Product>> GetProductByIdAsync(int productId)
        {
            var currentUser = _httpContextAccessor.HttpContext.User.Identity.Name;
            var product = await _context.Products
                .Include(x => x.ProductPhotos)
                .SingleOrDefaultAsync(x => x.Id == productId && x.Status != ProductStatus.HIDDEN);

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<Product>("Không tìm thấy sản phẩm"));
            }

            var path = _storageService.CreateProductPath(product.CategoryId, product.Name);

            foreach (var p in product.ProductPhotos)
            {
                p.Url = "https://localhost:5001/" + path + "/" + p.Url;
            }

            return await Task.FromResult(new ApiSuccessResult<Product>(product));
        }

        public async Task<ApiResult<List<Product>>> GetAllProductAsync()
        {
            // Lấy danh sách sản phẩm
            var products = await _context.Products
                .Include(x => x.ProductPhotos)
                .Where(x => x.Status != ProductStatus.HIDDEN)
                .ToListAsync();

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<Product>>("Không tìm thấy sản phẩm"));
            }

            // Tạo đường dẫn cho toàn bộ hình ảnh của sản phẩm
            foreach (var p in products)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(products));
        }

        public async Task<ApiResult<List<Product>>> GetByCateIdAsync(int cateId)
        {
            var cate = await _context.Categories.FindAsync(cateId);

            var products = new List<Product>();

            // Nếu Category là Root
            if (cate.RootId is null)
            {
                var query = from category in _context.Categories
                    where category.RootId.Equals(cateId)
                    join product in _context.Products.Include(x => x.ProductPhotos)
                        on category.Id equals product.CategoryId
                    select new
                    {
                        P = product
                    }.P;

                foreach (var p in query)
                {
                    products.Add(p);
                }
            }
            // Nếu Category thông thường
            else
            {
                products = await _context.Products
                    .Include(x => x.ProductPhotos)
                    .Where(x => x.CategoryId.Equals(cateId))
                    .ToListAsync();
            }

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<Product>>("Không tìm thấy sản phẩm"));
            }

            // Tạo đường dẫn cho toàn bộ hình ảnh của sản phẩm
            foreach (var p in products)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(products));
        }

        public async Task<ApiResult<List<Product>>> FilterAsync(FilterProductQuery filter)
        {
            if (string.IsNullOrWhiteSpace(filter.KeyWord))
                return await Task.FromResult(new ApiErrorResult<List<Product>>(""));
            var query = await _context.Products
                .Include(x => x.ProductPhotos)
                .Where(x => x.Status != ProductStatus.HIDDEN
                            && x.Name.Contains(filter.KeyWord)
                            || x.Description.Contains(filter.KeyWord)
                            || x.Specifications.Contains(filter.KeyWord)
                            || _context.SoundsLike(x.Name) == _context.SoundsLike(filter.KeyWord)
                            || _context.SoundsLike(x.Description) == _context.SoundsLike(filter.KeyWord))
                .ToListAsync();
                
            // Tạo đường dẫn cho toàn bộ hình ảnh của sản phẩm
            foreach (var p in query)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(query));
        }

        public async Task<ApiResult<List<Product>>> GetNewProductsAsync()
        {
            var query = await _context.Products
                .Include(x => x.ProductPhotos)
                .Where(x => x.Status == ProductStatus.NEW)
                .ToListAsync();

            // Tạo đường dẫn cho toàn bộ hình ảnh của sản phẩm
            foreach (var p in query)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);

                foreach (var i in p.ProductPhotos)
                {
                    i.Url = "https://localhost:5001/" + path + "/" + i.Url;
                }
            }

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(query));
        }
    }
}