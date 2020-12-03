using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.ForgotPassword
{
    public class ForgotPasswordCommand : IRequest<ApiResult<string>>
    {
        public string Email { get; set; }
    }

    public class ForgotPasswordHandle : IRequestHandler<ForgotPasswordCommand, ApiResult<string>>
    {
        private readonly IAuthService _authService;

        public ForgotPasswordHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<ApiResult<string>> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            return await _authService.ForgotPasswordAsync(request.Email);
        }
    }
}
