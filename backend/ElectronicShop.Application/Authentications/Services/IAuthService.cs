using ElectronicShop.Application.Authentications.Commands.Authenticate;
using ElectronicShop.Application.Authentications.Commands.ResetPassword;
using ElectronicShop.Application.Common.Models;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Services
{
    public interface IAuthService
    {
        Task<ApiResult<string>> AuthenticateAsync(AuthenticateCommand request);

        Task<bool> SignOutAsync();

        Task<ApiResult<string>> ForgotPasswordAsync(string email);

        Task<ApiResult<bool>> ResetPasswordAsync(ResetPasswordCommand request);
    }
}
