using ElectronicShop.Application.Common.Repositories;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Users.Repositories
{
    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}
