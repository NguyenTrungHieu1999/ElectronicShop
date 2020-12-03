using System.Threading.Tasks;

namespace ElectronicShop.Application.Categories.Services
{
    public interface ICategoryService
    {
        Task<int> CreateAsync();
    }
}