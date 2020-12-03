using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Queries.GetUserById
{
    public class GetByIdUserQuery : IRequest<ApiResult<UserVm>>
    {
        public int UserId { get; }

        public GetByIdUserQuery(int userId)
        {
            UserId = userId;
        }
    }

    public class GetByIdHandle : IRequestHandler<GetByIdUserQuery, ApiResult<UserVm>>
    {
        private readonly IUserService _userService;

        public GetByIdHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<UserVm>> Handle(GetByIdUserQuery request, CancellationToken cancellationToken)
        {
            return await _userService.GetByIdAsync(request.UserId);
        }
    }
}
