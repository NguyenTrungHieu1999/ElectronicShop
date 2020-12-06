using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Categories.Models;
using ElectronicShop.Application.Common.Models;

namespace ElectronicShop.Application.Categories.Services
{
    public interface ICategoryService
    {
        Task<ApiResult<string>> CreateAsync(CreateCategoryCommand request);

        Task<ApiResult<string>> UpdateAsync(UpdateCategoryCommand request);

        Task<ApiResult<CategoryVm>> GetById(int id);

        Task<ApiResult<List<CategoryVm>>> GetAll();
    }
}