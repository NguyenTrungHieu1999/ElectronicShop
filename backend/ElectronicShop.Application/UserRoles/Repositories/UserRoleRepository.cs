using ElectronicShop.Application.Common.Repositories;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.UserRoles.Repositories
{
    public class UserRoleRepository : RepositoryBase<UserRole>, IUserRoleRepository
    {
        public UserRoleRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}