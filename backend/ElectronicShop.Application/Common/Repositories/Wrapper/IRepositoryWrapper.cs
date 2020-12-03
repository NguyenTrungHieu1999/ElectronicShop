using System.Threading.Tasks;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
    }
}
