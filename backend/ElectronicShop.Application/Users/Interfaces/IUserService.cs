using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Models;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Interfaces
{
    public interface IUserService
    {
        Task<ApiResult<string>> AuthenticateAsync(LoginRequest request);

        Task<ApiResult<bool>> RegisterAsync(UserRegisterRequest request);
    }
}
