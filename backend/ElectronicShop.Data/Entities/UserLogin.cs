using Microsoft.AspNetCore.Identity;

namespace ElectronicShop.Data.Entities
{
    public class UserLogin: IdentityUserLogin<int>
    {
        public User User { get; set; }
    }
}
