using System.Threading.Tasks;

namespace ElectronicShop.Application.Common.Repositorys.Wrapper
{
    public interface IRepositoryWrapper
    {
        Task<int> SaveChangesAsync();
    }
}
