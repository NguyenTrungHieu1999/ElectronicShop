using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.ResetPassword
{
    public class ResetPasswordCommand : IRequest<ApiResult<bool>>
    {
        [Required]
        public string Token { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [RegularExpression("(?=^.{8,10}$)(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{\":;'?/>.<,])(?!.*\\s).*$", ErrorMessage = "Validation for 8-10 characters with characters,numbers,1 upper case letter and special characters.")]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }
    }

    public class ResetPasswordHandle : IRequestHandler<ResetPasswordCommand, ApiResult<bool>>
    {
        private readonly IAuthService _authService;

        public ResetPasswordHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<ApiResult<bool>> Handle(ResetPasswordCommand request, CancellationToken cancellationToken)
        {
            return await _authService.ResetPasswordAsync(request);
        }
    }
}
