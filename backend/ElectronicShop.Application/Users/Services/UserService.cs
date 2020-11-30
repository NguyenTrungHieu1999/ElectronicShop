﻿using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositorys.Wrapper;
using ElectronicShop.Application.Users.Interfaces;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Services.Common.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly IRepositoryWrapper _repository;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _config;

        public UserService(IRepositoryWrapper repository, UserManager<User> userManager,
            SignInManager<User> signInManager, IConfiguration config, IMapper mapper)
        {
            _repository = repository;
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
            _mapper = mapper;
        }

        public async Task<ApiResult<string>> AuthenticateAsync(LoginRequest request)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);

            if (user is null)
            {
                return new ApiErrorResult<string>("Account does not exist");
            }

            if (user.Status == UserStatus.DISABLE)
            {
                return new ApiErrorResult<string>("Account is locked");
            }

            var result = await _signInManager.PasswordSignInAsync(user.UserName, request.Password, request.RememberMe, true);

            if (!result.Succeeded)
            {
                return new ApiErrorResult<string>("Login incorrectly");
            }

            var roles = await _userManager.GetRolesAsync(user);

            var claims = new[]
            {
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.GivenName, user.LastName),
                new Claim(ClaimTypes.Role, string.Join(";", roles)),
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString())
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:Secret"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                _config["JWT:ValidIssuer"],
                _config["JWT:ValidAudience"],
                claims,
                expires: DateTime.Now.AddHours(3),
                signingCredentials: creds);

            return new ApiSuccessResult<string>(new JwtSecurityTokenHandler().WriteToken(token));
        }

        public async Task<ApiResult<bool>> RegisterAsync(UserRegisterRequest request)
        {
            var test = await _repository.UserRepo.FindByCondition(x=>x.Email == request.Email||x.UserName == request.UserName)
                .SingleOrDefaultAsync();

            if(test!=null)
            {
                return new ApiErrorResult<bool>("Account already exists");
            }

            var user = _mapper.Map<User>(request);

            user.CreatedDate = DateTime.Now;
            user.ModifiedDate = DateTime.Now;

            user.Status = UserStatus.ACTIVE;

            var result = await _userManager.CreateAsync(user, request.Password);

            if (result.Succeeded)
            {
                return new ApiSuccessResult<bool>();
            }

            return new ApiErrorResult<bool>("Registration failed");
        }
    }
}
