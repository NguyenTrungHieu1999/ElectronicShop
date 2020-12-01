using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Users.Command;
using ElectronicShop.Application.Users.Extensions;
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

namespace ElectronicShop.Application.Users.Service
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

        public async Task<ApiResult<string>> AuthenticateAsync(AuthenticateCommand request)
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

            var result = await _signInManager.PasswordSignInAsync(user.UserName,
                request.Password, request.RememberMe, true);

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

            return await Task.FromResult(new ApiSuccessResult<string>(new JwtSecurityTokenHandler().WriteToken(token)));
        }

        public async Task<ApiResult<bool>> RegisterAsync(RegisterUserCommand request)
        {
            var user = await _repository.UserRepo.FindByCondition(x => x.Email == request.Email || x.UserName == request.UserName)
                .SingleOrDefaultAsync();

            if (user != null)
            {
                return new ApiErrorResult<bool>("Account already exists");
            }

            user = _mapper.Map<User>(request);

            user.CreatedDate = DateTime.Now;
            user.ModifiedDate = DateTime.Now;

            user.Status = UserStatus.ACTIVE;

            var result = await _userManager.CreateAsync(user, request.Password);

            if (result.Succeeded)
            {
                return await Task.FromResult(new ApiSuccessResult<bool>());
            }

            return await Task.FromResult(new ApiErrorResult<bool>("Registration failed"));
        }

        public async Task<ApiResult<bool>> UpdateAsync(UpdateUserCommand request)
        {
            var user = await _userManager.FindByIdAsync(request.Id.ToString());

            user.Map(request);

            var result = await _userManager.UpdateAsync(user);

            if (result.Succeeded)
            {
                return await Task.FromResult(new ApiSuccessResult<bool>());
            }

            return await Task.FromResult(new ApiErrorResult<bool>("Update failed"));
        }

        public async Task<ApiResult<bool>> DeleteAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            if (user is null)
            {
                return new ApiErrorResult<bool>("User does not found");
            }

            user.Status = UserStatus.DELETED;

            var result = await _userManager.UpdateAsync(user);

            if (result.Succeeded)
            {
                return await Task.FromResult(new ApiSuccessResult<bool>());
            }

            return await Task.FromResult(new ApiErrorResult<bool>("Delete failed"));
        }
    }
}
