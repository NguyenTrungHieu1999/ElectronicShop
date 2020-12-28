using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Extensions;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Utilities.Session;
using ElectronicShop.Utilities.SystemConstants;
using Microsoft.AspNetCore.Http;
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
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IRepositoryWrapper _repository;

        public UserService(UserManager<User> userManager, IMapper mapper,
            IHttpContextAccessor httpContextAccessor, IRepositoryWrapper repository)
        {
            _userManager = userManager;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _repository = repository;
        }

        public async Task<ApiResult<bool>> CreateAsync(CreateUserCommand request)
        {
            var userEmail = await _userManager.FindByEmailAsync(request.Email);
            var userUserName = await _userManager.FindByNameAsync(request.UserName);

            if (userEmail != null || userUserName != null)
            {
                return new ApiErrorResult<bool>("Tài khoản đã tồn tại!");
            }

            request.Birthday.ToString("yyyy-MM-dd h:mm tt");

            var user = _mapper.Map<User>(request);

            user.CreatedDate = DateTime.Now;

            user.Status = UserStatus.ACTIVE;

            try
            {
                await _userManager.CreateAsync(user, request.Password);

                await AddUserRoleAsync(user, request.UserInRole);
            }
            catch
            {
                await _userManager.DeleteAsync(user);

                return await Task.FromResult(
                    new ApiErrorResult<bool>("Đăng ký thất bại, không thể thêm quyền cho người dùng."));
            }

            return await Task.FromResult(new ApiSuccessResult<bool>());

        }

        private async Task AddUserRoleAsync(User user, string roleName)
        {
            var isAdmin = _httpContextAccessor.HttpContext.User.IsInRole(Constants.ADMIN);

            var currentUser = _httpContextAccessor.HttpContext.Session
                .GetComplexData<User>(Constants.CURRENTUSER);

            string role = Constants.USERROLENAME;

            user.CreatedBy = user.UserName;

            if (isAdmin)
            {
                role = roleName;
                user.CreatedBy = currentUser.UserName;
            }

            await _userManager.UpdateAsync(user);

            await _userManager.AddToRoleAsync(user, role);
        }

        public async Task<ApiResult<bool>> UpdateAsync(UpdateUserCommand request)
        {
            var user = await _userManager.FindByIdAsync(request.Id.ToString());

            var username = _httpContextAccessor.HttpContext.Session
                .GetComplexData<User>(Constants.CURRENTUSER).UserName;

            request.Birthday.ToString("yyyy-MM-dd h:mm tt");

            try
            {
                await UpdateUserRoleAsync(user, request.UserInRole);

                user.Map(request);

                user.ModifiedBy = username;

                await _userManager.UpdateAsync(user);
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<bool>("Cập nhật thông tin người dùng thất bại"));
            }

            return await Task.FromResult(new ApiSuccessResult<bool>());
        }

        private async Task UpdateUserRoleAsync(User user, string roleName)
        {
            var isUser = _httpContextAccessor.HttpContext.User.IsInRole(Constants.USER);

            string role = isUser ? Constants.USERROLENAME : roleName;

            var useRole = await _repository.UserRoleRepository
                .FindByCondition(x => x.UserId == user.Id)
                .FirstAsync();

            _repository.UserRoleRepository.Delete(useRole);

            await _repository.SaveChangesAsync();

            await _userManager.AddToRoleAsync(user, role);
        }

        public async Task<ApiResult<bool>> DeleteAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            if (user is null)
            {
                return new ApiErrorResult<bool>("Người dùng không tồn tại");
            }

            user.Status = UserStatus.DELETED;

            var result = await _userManager.UpdateAsync(user);

            if (result.Succeeded)
            {
                return await Task.FromResult(new ApiSuccessResult<bool>());
            }

            return await Task.FromResult(new ApiErrorResult<bool>("Xóa người dùng thất bại"));
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

            var role = await _userManager.GetRolesAsync(user);

            result.UserInRole = role[0];

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
