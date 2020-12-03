using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Commands.DisableAccount
{
    public class DisableAccountCommand : IRequest<ApiResult<bool>>
    {
        public int UserId { get; }

        public DisableAccountCommand(int userId)
        {
            UserId = userId;
        }
    }

    public class DisableAccountHandle : IRequestHandler<DisableAccountCommand, ApiResult<bool>>
    {
        private readonly IUserService _userService;

        public DisableAccountHandle(IUserService userService)
        {
            _userService = userService;
        }

        public Task<ApiResult<bool>> Handle(DisableAccountCommand request, CancellationToken cancellationToken)
        {
            return _userService.DisableAccountAsync(request.UserId);
        }
    }
}
