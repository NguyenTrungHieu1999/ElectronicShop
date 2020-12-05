using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Common.Models;

namespace ElectronicShop.Application.Categories.Services
{
    public interface ICategoryService
    {
        Task<ApiResult<string>> CreateAsync(CreateCategoryCommand request);
    }
}