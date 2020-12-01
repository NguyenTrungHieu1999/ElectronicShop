using ElectronicShop.Application.Users.Repository;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Common.Repositories.Wrapper
{
    public interface IRepositoryWrapper
    {
        IUserRepository UserRepo { get; }

        Task<int> SaveChangesAsync();
    }
}
