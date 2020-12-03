using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.Authenticate
{
    public class AuthenticateCommand : IRequest<ApiResult<string>>
    {
        public string Email { get; set; }

        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }

    public class AuthenticateHandle : IRequestHandler<AuthenticateCommand, ApiResult<string>>
    {
        private readonly IAuthService _authService;

        public AuthenticateHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<ApiResult<string>> Handle(AuthenticateCommand request, CancellationToken cancellationToken)
        {
            return await _authService.AuthenticateAsync(request);
        }
    }
}
