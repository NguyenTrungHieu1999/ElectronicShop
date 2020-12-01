using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Service;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Command
{
    public class DeleteUserCommand : IRequest<ApiResult<bool>>
    {
        public int UserId { get; }

        public DeleteUserCommand(int userId)
        {
            UserId = userId;
        }
    }

    public class DeleteUserHandle : IRequestHandler<DeleteUserCommand, ApiResult<bool>>
    {
        private readonly IUserService _userService;

        public DeleteUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<bool>> Handle(DeleteUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.DeleteAsync(request.UserId);
        }
    }
}
