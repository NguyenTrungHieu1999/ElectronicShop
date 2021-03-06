﻿using ElectronicShop.Application.Authentications.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Authentications.Commands.Authenticate
{
    public class AuthenticateCommand : IRequest<ApiResult<string>>
    {
        [Required, DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required, DataType(DataType.Password)]
        [RegularExpression("(?=^.{8,30}$)(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{\":;'?/>.<,])(?!.*\\s).*$", 
            ErrorMessage = "Validation for 8-30 characters with characters,numbers,1 upper case letter and special characters.")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }

    public class AuthenticateHandle : IRequestHandler<AuthenticateCommand, ApiResult<string>>
    {
        private readonly IAuthService _authService;

        public AuthenticateHandle(IAuthService authService)
        {
            _authService = authService;
        }

        public async Task<ApiResult<string>> Handle(AuthenticateCommand request, CancellationToken cancellationToken)
        {
            return await _authService.AuthenticateAsync(request);
        }
    }
}
