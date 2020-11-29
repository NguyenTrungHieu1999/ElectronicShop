using Microsoft.AspNetCore.Identity;

namespace ElectronicShop.Data.Entities
{
    public class RoleClaim: IdentityRoleClaim<int>
    {
        public Role Role { get; set; }
    }
}
