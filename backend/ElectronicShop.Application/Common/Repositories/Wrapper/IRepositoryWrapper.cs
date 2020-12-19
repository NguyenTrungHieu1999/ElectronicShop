using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
<<<<<<< HEAD
<<<<<<< HEAD
using ElectronicShop.Application.ProductPhotos.Repositories;
=======
>>>>>>> parent of 0fd6cc0... temp
using ElectronicShop.Application.Products.Repositories;
=======
>>>>>>> parent of dfe0bd1... fix bugs
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
<<<<<<< HEAD
        
        IProductRepository ProductRepository { get; }
<<<<<<< HEAD

        IProductPhotoRepository ProductPhotoRepository { get; }
=======
>>>>>>> parent of dfe0bd1... fix bugs
=======
>>>>>>> parent of 0fd6cc0... temp
    }
}
