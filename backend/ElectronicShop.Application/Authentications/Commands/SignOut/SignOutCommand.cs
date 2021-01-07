using ElectronicShop.Application.Authentications.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.SignOut
{
    public class SignOutCommand : IRequest<bool>
    {

    }

    public class SignOutHandle : IRequestHandler<SignOutCommand, bool>
    {
        private readonly IAuthService _authService;

        public SignOutHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<bool> Handle(SignOutCommand request, CancellationToken cancellationToken)
        {
            return await _authService.SignOutAsync();
        }
    }
}
