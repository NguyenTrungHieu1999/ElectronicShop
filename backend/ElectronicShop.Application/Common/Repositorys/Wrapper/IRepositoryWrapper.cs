using ElectronicShop.Application.Users.Interfaces;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Common.Repositorys.Wrapper
{
    public interface IRepositoryWrapper
    {
        IUserRepository UserRepo { get; }

        Task<int> SaveChangesAsync();
    }
}
