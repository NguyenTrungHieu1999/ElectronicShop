using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Service;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Command
{
    public class AuthenticateCommand : IRequest<ApiResult<string>>
    {
        public string Email { get; set; }

        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }

    public class AuthenticateHandle : IRequestHandler<AuthenticateCommand, ApiResult<string>>
    {
        private readonly IUserService _userService;

        public AuthenticateHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<string>> Handle(AuthenticateCommand request, CancellationToken cancellationToken)
        {
            return await _userService.AuthenticateAsync(request);
        }
    }
}
