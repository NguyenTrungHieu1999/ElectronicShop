using ElectronicShop.Data.Enums;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class User : IdentityUser<int>
    {
        public string FirstMiddleName { get; set; }

        public string LastName { get; set; }

        public string Address { get; set; }

        public UserStatus Status { get; set; }

        public Gender Sex { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime ModifiedDate { get; set; }

        public string CreatedBy { get; set; }

        public string ModifiedBy { get; set; }

        public List<FavoriteProduct> FavoriteProducts { get; set; }

        public List<WatchedProduct> WatchedProducts { get; set; }

        public List<Comment> Comments { get; set; }
       
        public List<ProductReview> ProductReviews { get; set; }

        public List<Order> Orders { get; set; }

        public List<UserRole> UserRoles { get; set; }

        public List<UserClaim> UserClaims { get; set; }

        public List<UserLogin> UserLogins { get; set; }

        public List<UserToken> UserTokens { get; set; }
    }
}
