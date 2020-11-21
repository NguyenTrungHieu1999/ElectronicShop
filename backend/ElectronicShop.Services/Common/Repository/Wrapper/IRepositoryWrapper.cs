using System.Threading.Tasks;

namespace ElectronicShop.Services.Common.Repository.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
    }
}
