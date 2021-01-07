using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.ExternalLogins
{
    public class ExternalLoginsCommand : IRequest<ApiResult<string>>
    {
        public string Email { get; set; }

        public string UserName { get; set; }

        public string FirstMiddleName { get; set; }

        public string LastName { get; set; }

        public string LoginProvider { get; set; }

        public string ProviderKey { get; set; }

        public string ProviderDisplayName { get; set; }
    }

    public class ExternalLoginsHandle : IRequestHandler<ExternalLoginsCommand, ApiResult<string>> 
    {
        private readonly IAuthService _authService;

        public ExternalLoginsHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<ApiResult<string>> Handle(ExternalLoginsCommand request, CancellationToken cancellationToken)
        {
            return await _authService.ExternalLogins(request);
        }
    }
}
