using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using ElectronicShop.Data.Enums;
using MediatR;
using System;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Commands.UpdateUser
{
    public class UpdateUserCommand : IRequest<ApiResult<string>>
    {
        public int Id { get; set; }

        public string FirstMiddleName { get; set; }

        public string LastName { get; set; }

        public DateTime? Birthday { get; set; }

        public Gender Gender { get; set; }

        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        public UserStatus Status { get; set; }

        public string UserInRole { get; set; }
    }

    public class UpdateUserHandle : IRequestHandler<UpdateUserCommand, ApiResult<string>>
    {
        private readonly IUserService _userService;

        public UpdateUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<string>> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.UpdateAsync(request);
        }
    }
}
