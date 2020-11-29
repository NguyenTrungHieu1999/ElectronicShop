using ElectronicShop.Application.Common.Repositorys;
using ElectronicShop.Application.Users.Interfaces;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Users.Services
{
    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}
