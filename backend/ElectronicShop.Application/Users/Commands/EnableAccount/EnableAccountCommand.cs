using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;

namespace ElectronicShop.Application.Users.Commands.EnableAccount
{
    public class EnableAccountCommand : IRequest<ApiResult<string>>
    {
        public EnableAccountCommand(int userId)
        {
            UserId = userId;
        }

        public int UserId { get; }
    }
    
    public class EnableAccountHandle : IRequestHandler<EnableAccountCommand, ApiResult<string>>
    {
        private readonly IUserService _service;

        public EnableAccountHandle(IUserService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(EnableAccountCommand request, CancellationToken cancellationToken)
        {
            return await _service.EnableAccountAsync(request.UserId);
        }
    }
}