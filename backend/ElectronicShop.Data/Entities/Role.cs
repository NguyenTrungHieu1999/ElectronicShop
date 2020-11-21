using Microsoft.AspNetCore.Identity;

namespace ElectronicShop.Data.Entities
{
    public class Role : IdentityRole<int>
    {
        public string Description { get; set; }
    }
}
