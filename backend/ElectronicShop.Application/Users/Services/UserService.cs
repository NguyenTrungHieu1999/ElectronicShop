using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Extensions;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Services.Common.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly UserManager<User> _userManager;

        public UserService(UserManager<User> userManager, IMapper mapper)
        {
            _userManager = userManager;
            _mapper = mapper;
        }

        public async Task<ApiResult<bool>> CreateAsync(CreateUserCommand request)
        {
            var userEmail = await _userManager.FindByEmailAsync(request.Email);
            var useruserName = await _userManager.FindByNameAsync(request.UserName);

            if (userEmail != null || useruserName != null)
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
