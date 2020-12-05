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
    public class UpdateUserCommand : IRequest<ApiResult<bool>>
    {
        public int Id { get; set; }

        [Required, StringLength(50, MinimumLength = 1)]
        public string FirstMiddleName { get; set; }

        [Required, StringLength(30, MinimumLength = 1)]
        public string LastName { get; set; }

        [Required, DataType(DataType.Date)]
        public DateTime Birthday { get; set; }

        [Required]
        public Gender Gender { get; set; }

        [Required, DataType(DataType.PhoneNumber), StringLength(11)]
        [Phone]
        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        [Required]
        public UserStatus Status { get; set; }

        public string UserInRole { get; set; }
    }

    public class UpdateUserHandle : IRequestHandler<UpdateUserCommand, ApiResult<bool>>
    {
        private readonly IUserService _userService;

        public UpdateUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<bool>> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.UpdateAsync(request);
        }
    }
}
