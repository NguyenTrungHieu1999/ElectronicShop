using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Application.Products.Models;
using ElectronicShop.Application.Products.Queries.GetAllProduct;

namespace ElectronicShop.Application.Products.Services
{
    public interface IProductService
    {
        Task<ApiResult<string>> CreateAsync(CreateProductCommand request);

        Task<ApiResult<string>> UpdateAsync(UpdateProductCommand update);

        Task<ApiResult<string>> DeleteAsync(int productId);

        Task<ApiResult<ProductVm>> GetProductByIdAsync(int productId);

        Task<ApiResult<List<ProductVm>>> GetAllProductAsync(GetAllProductQuery request);
    }
}