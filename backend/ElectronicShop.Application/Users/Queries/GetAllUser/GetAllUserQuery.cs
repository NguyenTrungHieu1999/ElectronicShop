using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Queries.GetAllUser
{
    public class GetAllUserQuery : IRequest<ApiResult<List<UserVm>>>
    {
    }

    public class GetAllUserHandle : IRequestHandler<GetAllUserQuery, ApiResult<List<UserVm>>>
    {
        private readonly IUserService _userService;

        public GetAllUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<List<UserVm>>> Handle(GetAllUserQuery request, CancellationToken cancellationToken)
        {
            return await _userService.GetAllAsync();
        }
    }
}
