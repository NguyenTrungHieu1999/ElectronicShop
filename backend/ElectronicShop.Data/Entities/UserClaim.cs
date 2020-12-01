using Microsoft.AspNetCore.Identity;

namespace ElectronicShop.Data.Entities
{
    public class UserClaim : IdentityUserClaim<int>
    {
        public User User { get; set; }
    }
}
