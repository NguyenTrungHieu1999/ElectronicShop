using ElectronicShop.Data.EF;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
using ElectronicShop.Application.UserRoles.Repositories;
using ElectronicShop.Application.Users.Repositories;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private ElectronicShopDbContext _repoContext;

        private ICategoryRepository _category;
        private IUserRoleRepository _userRole;
        private IUserRepository _user;
<<<<<<< HEAD
        private IProductRepository _product;
<<<<<<< HEAD
        private IProductPhotoRepository _productPhoto;
=======
>>>>>>> parent of dfe0bd1... fix bugs
=======
>>>>>>> parent of 0fd6cc0... temp

        public RepositoryWrapper(ElectronicShopDbContext repoContext)
        {
            _repoContext = repoContext;
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _repoContext.SaveChangesAsync();
        }

        public ICategoryRepository CategoryRepository => _category ??= new CategoryRepository(_repoContext);

        public IUserRoleRepository UserRoleRepository => _userRole ??= new UserRoleRepository(_repoContext);

        public IUserRepository UserRepository => _user ??= new UserRepository(_repoContext);
<<<<<<< HEAD

        public IProductRepository ProductRepository => _product ??= new ProductRepository(_repoContext);
<<<<<<< HEAD

        public IProductPhotoRepository ProductPhotoRepository => _productPhoto ??= new ProductPhotoRepository(_repoContext);
=======
>>>>>>> parent of dfe0bd1... fix bugs
=======
>>>>>>> parent of 0fd6cc0... temp
    }
}
