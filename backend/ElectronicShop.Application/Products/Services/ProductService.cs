using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Application.Products.Extensions;
using ElectronicShop.Application.Products.Queries.FilterProduct;
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
            await using var transaction = await _context.Database.BeginTransactionAsync();

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

                await transaction.CommitAsync();

                return new ApiSuccessResult<string>("Thêm sản phẩm thành công");
            }
            catch
            {
                await transaction.RollbackAsync();
                return new ApiErrorResult<string>("Thêm sản phẩm thất bại");
            }
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateProductCommand update)
        {
            var product = await _context.Products.FindAsync(update.Id);

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm cần cập nhật"));
            }

            string sPath = _storageService.CreateProductPath(product.CategoryId, product.Name);

            string dPath = _storageService.CreateProductPath(product.CategoryId, update.Name);

            _storageService.ChangeNameFolder(sPath, dPath);

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

            product.Status = ProductStatus.DELETED;
            product.ModifiedBy = _httpContextAccessor.HttpContext.User.Identity.Name;
            product.ModifiedDate = DateTime.Now;

            _context.Products.Update(product);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa sản phẩm thành công"));
        }

        public async Task<ApiResult<Product>> GetProductByIdAsync(int productId)
        {
            var product = await _context.Products
                .Include(x => x.ProductPhotos)
                .SingleOrDefaultAsync(x => x.Id == productId && x.Status != ProductStatus.DELETED);

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
                .Where(x => x.Status != ProductStatus.DELETED)
                .AsNoTracking()
                .ToListAsync();

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<Product>>("Không tìm thấy sản phẩm"));
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
                            join product in _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN)
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
                    .Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN && x.CategoryId.Equals(cateId))
                    .AsNoTracking()
                    .ToListAsync();
            }

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<Product>>("Không tìm thấy sản phẩm"));
            }

            var results = await CreatePathPhotos(products);

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(results));
        }

        public async Task<ApiResult<List<Product>>> SearchAsync(SearchProductQuery filter)
        {
            if (string.IsNullOrWhiteSpace(filter.KeyWord))
                return await Task.FromResult(new ApiErrorResult<List<Product>>(""));
            var query = await _context.Products
                .Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN
                            && x.Name.Contains(filter.KeyWord)
                            || x.Description.Contains(filter.KeyWord)
                            || x.Specifications.Contains(filter.KeyWord)
                            || _context.SoundsLike(x.Name) == _context.SoundsLike(filter.KeyWord)
                            || _context.SoundsLike(x.Description) == _context.SoundsLike(filter.KeyWord))
                .ToListAsync();

            var products = await _context.Products
                .Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN
                            && x.Name == filter.KeyWord
                            || x.Description == (filter.KeyWord)
                            || x.Specifications == (filter.KeyWord))
                .ToListAsync();

            if (products.Count > 0)
            {
                query = new List<Product>();
                query = products;
            }

            var results = await CreatePathPhotos(query);

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(results));
        }

        public async Task<ApiResult<List<Product>>> GetNewProductsAsync()
        {
            var query = await _context.Products
                .Where(x => x.Status == ProductStatus.NEW)
                .ToListAsync();

            var results = await CreatePathPhotos(query);

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(results));
        }

        public async Task<ApiResult<List<Product>>> FilterAsync(FilterProductQuery query)
        {
            var products = query.Price switch
            {
                1 => await _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN && x.Price < 10000000).ToListAsync(),
                2 => await _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN && x.Price >= 10000000 && x.Price < 20000000).ToListAsync(),
                3 => await _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN && x.Price >= 20000000 && x.Price < 40000000).ToListAsync(),
                4 => await _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN && x.Price >= 40000000).ToListAsync(),
                _ => await _context.Products.Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN).ToListAsync()
            };

            products = query.Sorted switch
            {
                1 => products.OrderBy(x => x.Price).ToList(),
                2 => products.OrderByDescending(x => x.Price).ToList(),
                _ => products.ToList(),
            };

            var results = await CreatePathPhotos(products);

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(results));
        }

        public async Task<ApiResult<string>> DisableAsync(int productId)
        {
            var product = await _context.Products
                .Where(x => x.Id == productId
                       && x.Status != ProductStatus.DELETED
                       && x.Status != ProductStatus.HIDDEN)
                .SingleOrDefaultAsync();

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm"));
            }

            product.Status = ProductStatus.HIDDEN;
            product.ModifiedBy = _httpContextAccessor.HttpContext.User.Identity.Name;
            product.ModifiedDate = DateTime.Now;
            
            _context.Update(product);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Khóa sản phẩm thành công"));
        }

        private async Task<List<Product>> CreatePathPhotos(List<Product> products)
        {
            foreach (var p in products)
            {
                var path = _storageService.CreateProductPath(p.CategoryId, p.Name);
                var photos = await _context.ProductPhotos.Where(x => x.ProductId == p.Id).ToListAsync();
                p.ProductPhotos = new List<ProductPhoto>();

                for (var i = 0; i < 2; i++)
                {
                    if (photos.Count >= 2)
                    {
                        p.ProductPhotos.Add(photos[i]);
                        p.ProductPhotos[i].Url = "https://localhost:5001/" + path + "/" + photos[i].Url;
                    }
                }
            }

            return products;
        }

        public async Task<ApiResult<string>> EnableAsync(int productId)
        {
            var product = await _context.Products
                .Where(x => x.Id == productId
                       && x.Status != ProductStatus.DELETED
                       && x.Status == ProductStatus.HIDDEN)
                .SingleOrDefaultAsync();

            if (product is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy sản phẩm"));
            }

            product.Status = ProductStatus.DEFAULT;
            product.ModifiedBy = _httpContextAccessor.HttpContext.User.Identity.Name;
            product.ModifiedDate = DateTime.Now;
            
            _context.Update(product);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Mở khóa sản phẩm thành công"));
        }

        public async Task<ApiResult<List<Product>>> GetAllForClientAsync()
        {
            // Lấy danh sách sản phẩm
            var products = await _context.Products
                .Where(x => x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN)
                .AsNoTracking()
                .ToListAsync();

            if (products is null)
            {
                return await Task.FromResult(new ApiErrorResult<List<Product>>("Không tìm thấy sản phẩm"));
            }

            var results = await CreatePathPhotos(products);

            return await Task.FromResult(new ApiSuccessResult<List<Product>>(results));
        }

        public async Task<ApiResult<Product>> GetByIdForClientAsync(int productId)
        {
            var product = await _context.Products
                .Include(x => x.ProductPhotos)
                .SingleOrDefaultAsync(x => x.Id == productId && x.Status != ProductStatus.DELETED && x.Status != ProductStatus.HIDDEN);

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

    }
}