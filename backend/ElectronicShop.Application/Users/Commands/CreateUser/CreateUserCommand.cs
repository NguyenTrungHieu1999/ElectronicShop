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
    public class CreateUserCommand : IRequest<ApiResult<string>>
    {
        [Required, StringLength(30, MinimumLength = 1)]
        public string UserName { get; set; }

        [Required, DataType(DataType.Password)]
        [RegularExpression("(?=^.{8,30}$)(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{\":;'?/>.<,])(?!.*\\s).*$", ErrorMessage = "Validation for 8-10 characters with characters,numbers,1 upper case letter and special characters.")]
        public string Password { get; set; }

        [Required, DataType(DataType.Password)]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }

        [Required, DataType(DataType.EmailAddress), StringLength(50, MinimumLength = 1)]
        [EmailAddress]
        public string Email { get; set; }

        public string FirstMiddleName { get; set; }

        public string LastName { get; set; }

        public DateTime? Birthday { get; set; }

        [Required]
        public Gender Gender { get; set; }

        public string Address { get; set; }

        public string PhoneNumber { get; set; }

        public string UserInRole { get; set; }
    }

    public class CreateUserHandle : IRequestHandler<CreateUserCommand, ApiResult<string>>
    {
        private readonly IUserService _userService;

        public CreateUserHandle(IUserService userService)
        {
            _userService = userService;
        }

        public async Task<ApiResult<string>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            return await _userService.CreateAsync(request);
        }
    }
}
