using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Extensions;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Services.Common.Models;
using ElectronicShop.Utilities.Session;
using ElectronicShop.Utilities.SystemConstants;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using UserRole = ElectronicShop.Data.Entities.UserRole;

namespace ElectronicShop.Application.Users.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly UserManager<User> _userManager;
        private readonly RoleManager<Role> _roleManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IRepositoryWrapper _repository;

        public UserService(UserManager<User> userManager, IMapper mapper,
            IHttpContextAccessor httpContextAccessor, IRepositoryWrapper repository, RoleManager<Role> roleManager)
        {
            _userManager = userManager;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _repository = repository;
            _roleManager = roleManager;
        }

        public async Task<ApiResult<bool>> CreateAsync(CreateUserCommand request)
        {
            var userEmail = await _userManager.FindByEmailAsync(request.Email);
            var userUserName = await _userManager.FindByNameAsync(request.UserName);

            // Check for user existence
            if (userEmail != null || userUserName != null)
            {
                return new ApiErrorResult<bool>("Account already exists");
            }

            // Create User
            var user = _mapper.Map<User>(request);

            user.CreatedDate = DateTime.Now;

            user.Status = UserStatus.ACTIVE;

            var result = await _userManager.CreateAsync(user, request.Password);

            if (!result.Succeeded)
            {
                return await Task.FromResult(new ApiErrorResult<bool>("Registration failed"));
            }

            var isAdmin = _httpContextAccessor.HttpContext.User.IsInRole("Admin");

            string roleName = isAdmin ? request.UserInRole : "USER";

            await _userManager.AddToRoleAsync(user, roleName);

            return await Task.FromResult(new ApiSuccessResult<bool>());

        }

        public async Task<ApiResult<bool>> UpdateAsync(UpdateUserCommand request)
        {
            // Update User
            var user = await _userManager.FindByIdAsync(request.Id.ToString());

            user.Map(request);

            var username = _httpContextAccessor.HttpContext.Session.GetComplexData<User>(Constants.CURRENTUSER).UserName;

            user.ModifiedBy = username;

            var result = await _userManager.UpdateAsync(user);

            if (!result.Succeeded)
            {
                return await Task.FromResult(new ApiErrorResult<bool>("Update failed"));   
            }

            // Update UserRole
            var isUser = _httpContextAccessor.HttpContext.User.IsInRole("User");

            if(isUser)
            {
                request.UserInRole = "USER";
            }

            var useRole = await _repository.UserRoleRepository.FindByCondition(x => x.UserId == user.Id).FirstAsync();

            _repository.UserRoleRepository.Delete(useRole);

            var test = await _repository.SaveChangesAsync();

            //var roles = await _userManager.GetRolesAsync(user);

            //var isuser = await _userManager.GetUsersInRoleAsync("User");

            //var test = await _userManager.RemoveFromRolesAsync(user, roles);

            await _userManager.AddToRoleAsync(user, request.UserInRole);

            return await Task.FromResult(new ApiSuccessResult<bool>());
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

        public async Task<ApiResult<bool>> DisableAccountAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            user.Status = UserStatus.DISABLE;

            await _userManager.UpdateAsync(user);

            return await Task.FromResult(new ApiSuccessResult<bool>());
        }

        public async Task<ApiResult<UserVm>> GetByIdAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            var result = _mapper.Map<UserVm>(user);

            return await Task.FromResult(new ApiSuccessResult<UserVm>(result));
        }

        public async Task<ApiResult<List<UserVm>>> GetAllAsync()
        {
            var users = await _userManager.Users.ToListAsync();

            var result = _mapper.Map<List<UserVm>>(users);

            return await Task.FromResult(new ApiSuccessResult<List<UserVm>>(result));
        }
    }
}
