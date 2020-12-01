using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Command;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Service
{
    public interface IUserService
    {
        Task<ApiResult<string>> AuthenticateAsync(AuthenticateCommand request);

        Task<ApiResult<bool>> RegisterAsync(RegisterUserCommand request);

        Task<ApiResult<bool>> UpdateAsync(UpdateUserCommand request);

        Task<ApiResult<bool>> DeleteAsync(int userId);
    }
}
