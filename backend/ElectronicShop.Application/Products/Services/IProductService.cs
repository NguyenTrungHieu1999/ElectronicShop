using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;

namespace ElectronicShop.Application.Products.Services
{
    public interface IProductService
    {
        Task<ApiResult<string>> CreateAsync(CreateProductCommand request);
    }
}