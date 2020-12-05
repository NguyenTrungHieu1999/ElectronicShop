using ElectronicShop.Data.EF;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Repositories;
using ElectronicShop.Application.UserRoles.Repositories;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private ElectronicShopDbContext _repoContext;

        private ICategoryRepository _category;
        private IUserRoleRepository _userRole;

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
    }
}
