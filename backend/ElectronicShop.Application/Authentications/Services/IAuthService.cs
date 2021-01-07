using ElectronicShop.Application.Authentications.Commands.Authenticate;
using ElectronicShop.Application.Authentications.Commands.ExternalLogins;
using ElectronicShop.Application.Authentications.Commands.ResetPassword;
using ElectronicShop.Application.Common.Models;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Services
{
    public interface IAuthService
    {
        Task<ApiResult<string>> AuthenticateAsync(AuthenticateCommand request);

        Task<ApiResult<string>> ExternalLogins(ExternalLoginsCommand command);

        Task<bool> SignOutAsync();

        Task<ApiResult<string>> ForgotPasswordAsync(string email);

        Task<ApiResult<string>> ResetPasswordAsync(ResetPasswordCommand request);
    }
}
