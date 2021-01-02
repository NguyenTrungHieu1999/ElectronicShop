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

        public string FirstMidleName { get; set; }

        public string LastName { get; set; }

        public string LoginProvider { get; set; }

        public string ProviderKey { get; set; }

        public string ProviderDisplayName { get; set; }
    }

    public class ExternalLoginsHandle : IRequestHandler<ExternalLoginsCommand, ApiResult<string>> 
    {
        public Task<ApiResult<string>> Handle(ExternalLoginsCommand request, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}
