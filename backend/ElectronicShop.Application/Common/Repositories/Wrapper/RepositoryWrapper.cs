using ElectronicShop.Data.EF;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
using ElectronicShop.Application.Products.Repositories;
using ElectronicShop.Application.UserRoles.Repositories;
using ElectronicShop.Application.Users.Repositories;
using ElectronicShop.Application.ProductPhotos.Repositories;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private readonly ElectronicShopDbContext _repoContext;

        private ICategoryRepository _category;
        private IUserRoleRepository _userRole;
        private IUserRepository _user;
        private IProductRepository _product;
        private IProductPhotoRepository _productPhoto;

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

        public IProductRepository ProductRepository => _product ??= new ProductRepository(_repoContext);

        public IProductPhotoRepository ProductPhotoRepository => _productPhoto ??= new ProductPhotoRepository(_repoContext);
    }
}
