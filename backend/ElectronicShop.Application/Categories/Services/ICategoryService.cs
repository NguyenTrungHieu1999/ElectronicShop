using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Categories.Services
{
    public interface ICategoryService
    {
        Task<ApiResult<string>> CreateAsync(CreateCategoryCommand request);

        Task<ApiResult<string>> UpdateAsync(UpdateCategoryCommand request);

        Task<ApiResult<Category>> GetByIdAsync(int id);

        Task<ApiResult<List<Category>>> GetAllAsync();

        Task<ApiResult<List<ProductType>>> GetAllProductTypeAsync();
    }
}