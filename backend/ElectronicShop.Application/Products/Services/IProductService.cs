using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Application.Products.Queries.FilterProduct;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Products.Services
{
    public interface IProductService
    {
        Task<ApiResult<string>> CreateAsync(CreateProductCommand request);
        Task<ApiResult<string>> UpdateAsync(UpdateProductCommand update);
        Task<ApiResult<string>> DeleteAsync(int productId);
        Task<ApiResult<Product>> GetProductByIdAsync(int productId);
        Task<ApiResult<List<Product>>> GetAllProductAsync();
        Task<ApiResult<List<Product>>> GetByCateIdAsync(int cateId);
        Task<ApiResult<List<Product>>> SearchAsync(SearchProductQuery query);
        Task<ApiResult<List<Product>>> GetNewProductsAsync();
        Task<ApiResult<List<Product>>> FilterAsync(FilterProductQuery query);
        Task<ApiResult<string>> DisableAsync(int productId);
        Task<ApiResult<string>> EnableAsync(int productId);
        Task<ApiResult<List<Product>>> GetAllForClientAsync();
        Task<ApiResult<Product>> GetByIdForClientAsync(int productId);
    }
}