using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
using ElectronicShop.Application.UserRoles.Repositories;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
        
        ICategoryRepository CategoryRepository { get; }
        
        IUserRoleRepository UserRoleRepository { get; }
    }
}
