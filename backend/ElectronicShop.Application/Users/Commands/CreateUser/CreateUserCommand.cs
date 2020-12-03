using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using ElectronicShop.Data.Enums;
using MediatR;
using System;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Commands.CreateUser
{
    public class CreateUserCommand : IRequest<ApiResult<bool>>
    {
        [Required, StringLength(30, MinimumLength = 1)]
        public string UserName { get; set; }

        [Required, DataType(DataType.Password)]
        [RegularExpression("(?=^.{8,10}$)(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{\":;'?/>.<,])(?!.*\\s).*$", ErrorMessage = "Validation for 8-10 characters with characters,numbers,1 upper case letter and special characters.")]
        public string Password { get; set; }

        [Required, DataType(DataType.Password)]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }

        [Required, DataType(DataType.EmailAddress), StringLength(50, MinimumLength = 1)]
        [EmailAddress]
        public string Email { get; set; }

        [Required, StringLength(50, MinimumLength = 1)]
        public string FirstMiddleName { get; set; }

        [Required, StringLength(20, MinimumLength = 1)]
        public string LastName { get; set; }

        [Required, DataType(DataType.Date)]
        public DateTime Birthday { get; set; }

        [Required]
        public Gender Gender { get; set; }

        public string Address { get; set; }

        [Required, DataType(DataType.PhoneNumber), StringLength(11)]
        [Phone]
        public string PhoneNumber { get; set; }
    }

    public class CreateUserHandle : IRequestHandler<CreateUserCommand, ApiResult<bool>>
    {
        private readonly IUserService _userService;

        public CreateUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<bool>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.CreateAsync(request);
        }
    }
}
