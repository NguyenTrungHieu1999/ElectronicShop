using System.Threading.Tasks;

namespace ElectronicShop.Services.Common.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
    }
}
