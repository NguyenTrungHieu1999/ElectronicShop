using Microsoft.AspNetCore.Authorization;

namespace ElectronicShop.WebApi.AuthorizeRoles
{
    public class AuthorizeRolesAttribute : AuthorizeAttribute
    {
        public AuthorizeRolesAttribute(params string[] roles) : base()
        {
            Roles = string.Join(",", roles);
        }
    }
}