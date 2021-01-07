using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
using ElectronicShop.Application.Orders.Repositories;
using ElectronicShop.Application.ProductPhotos.Repositories;
using ElectronicShop.Application.Products.Repositories;
using ElectronicShop.Application.UserRoles.Repositories;
using ElectronicShop.Application.Users.Repositories;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
        
        ICategoryRepository CategoryRepository { get; }
        
        IUserRoleRepository UserRoleRepository { get; }

        IUserRepository UserRepository { get; }
        
        IProductRepository ProductRepository { get; }

        IProductPhotoRepository ProductPhotoRepository { get; }

        IOrderRepository OrderRepository { get; }
    }
}
