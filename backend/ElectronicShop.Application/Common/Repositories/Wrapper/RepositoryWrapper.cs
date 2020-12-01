using ElectronicShop.Application.Users.Repository;
using ElectronicShop.Data.EF;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private ElectronicShopDbContext _repoContext;

        private IUserRepository _user;

        public RepositoryWrapper(ElectronicShopDbContext repoContext)
        {
            _repoContext = repoContext;
        }

        public IUserRepository UserRepo
        {
            get
            {
                if (_user == null)
                {
                    _user = new UserRepository(_repoContext);
                }

                return _user;
            }
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _repoContext.SaveChangesAsync();
        }
    }
}
