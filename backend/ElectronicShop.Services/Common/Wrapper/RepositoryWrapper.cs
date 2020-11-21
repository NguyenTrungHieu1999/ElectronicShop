using ElectronicShop.Data.EF;
using System.Threading.Tasks;

namespace ElectronicShop.Services.Common.Wrapper
{
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private ElectronicShopDbContext _repoContext;

        public RepositoryWrapper(ElectronicShopDbContext repoContext)
        {
            _repoContext = repoContext;
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _repoContext.SaveChangesAsync();
        }
    }
}
