using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Commands.DeleteUser
{
    public class DeleteUserCommand : IRequest<ApiResult<string>>
    {
        public int UserId { get; }

        public DeleteUserCommand(int userId)
        {
            UserId = userId;
        }
    }

    public class DeleteUserHandle : IRequestHandler<DeleteUserCommand, ApiResult<string>>
    {
        private readonly IUserService _userService;

        public DeleteUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<string>> Handle(DeleteUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.DeleteAsync(request.UserId);
        }
    }
}
