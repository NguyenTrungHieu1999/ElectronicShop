using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class Role : IdentityRole<int>
    {
        public string Description { get; set; }

        public List<UserRole> UserRoles { get; set; }

        public List<RoleClaim> RoleClaims { get; set; }
    }
}
