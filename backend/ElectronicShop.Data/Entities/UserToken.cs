using Microsoft.AspNetCore.Identity;

namespace ElectronicShop.Data.Entities
{
    public class UserToken: IdentityUserToken<int>
    {
        public User User { get; set; }
    }
}
