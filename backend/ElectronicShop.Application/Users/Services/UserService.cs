using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Extensions;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;
using ElectronicShop.Utilities.SystemConstants;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElectronicShop.Data.EF;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.Users.Services
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        private readonly UserManager<User> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;

        public UserService(UserManager<User> userManager, IMapper mapper,
            IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
            _userManager = userManager;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateUserCommand request)
        {
            var userEmail = await _userManager.FindByEmailAsync(request.Email);
            var userUserName = await _userManager.FindByNameAsync(request.UserName);

            if (userEmail != null || userUserName != null)
            {
                return new ApiErrorResult<string>("Tài khoản đã tồn tại!");
            }

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
                return await Task.FromResult(new ApiErrorResult<string>("Đăng ký thất bại, không thể thêm quyền cho người dùng."));
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm người dùng thành công"));

        }

        private async Task AddUserRoleAsync(User user, string roleName)
        {
            var isAdmin = _httpContextAccessor.HttpContext.User.IsInRole(Constants.ADMIN);
            var currentUser = _httpContextAccessor.HttpContext.User.Identity.Name;
            var role = Constants.USERROLENAME;
            user.CreatedBy = user.UserName;

            if (isAdmin)
            {
                role = roleName;
                user.CreatedBy = currentUser;
            }

            await _userManager.UpdateAsync(user);
            await _userManager.AddToRoleAsync(user, role);
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateUserCommand request)
        {
            var isAuthen = _httpContextAccessor.HttpContext.User.Identity.IsAuthenticated;
            if (isAuthen is false)
            {
                return new ApiErrorResult<string>("Mời đăng nhập vào tài khoản!");
            }

            var user = await _userManager.FindByIdAsync(request.Id.ToString());

            if (user is null)
            {
                return new ApiErrorResult<string>("Người dùng không tồn tại");
            }

            var username = _httpContextAccessor.HttpContext.User.Identity.Name;

            try
            {
                await UpdateUserRoleAsync(user, request.UserInRole);
                user.Map(request);
                user.ModifiedBy = username;
                await _userManager.UpdateAsync(user);
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<string>("Cập nhật thông tin người dùng thất bại"));
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật người dùng thành công"));
        }

        private async Task UpdateUserRoleAsync(User user, string roleName)
        {
            var isUser = _httpContextAccessor.HttpContext.User.IsInRole(Constants.USER);
            var role = isUser ? Constants.USERROLENAME : roleName;

            var useRole = await _context.UserRoles
                .Where(x => x.UserId == user.Id)
                .FirstAsync();

            _context.UserRoles.Remove(useRole);
            await _context.SaveChangesAsync();
            await _userManager.AddToRoleAsync(user, role);
        }

        public async Task<ApiResult<string>> DeleteAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());
            if (user is null)
            {
                return new ApiErrorResult<string>("Người dùng không tồn tại");
            }

            user.Status = UserStatus.DELETED;
            var result = await _userManager.UpdateAsync(user);

            if (result.Succeeded)
            {
                return await Task.FromResult(new ApiSuccessResult<string>("Xóa người dùng thành công"));
            }

            return await Task.FromResult(new ApiErrorResult<string>("Xóa người dùng thất bại"));
        }

        public async Task<ApiResult<string>> DisableAccountAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            if (user is null || user.Status == UserStatus.DELETED)
            {
                return new ApiErrorResult<string>("Người dùng không tồn tại");
            }

            user.Status = UserStatus.DISABLE;
            user.ModifiedBy = _httpContextAccessor.HttpContext.User.Identity.Name;
            user.ModifiedDate = DateTime.Now;

            await _userManager.UpdateAsync(user);

            return await Task.FromResult(new ApiSuccessResult<string>("Khóa tài khoản thành công"));
        }

        public async Task<ApiResult<UserVm>> GetByIdAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            if (user is null || user.Status.Equals(UserStatus.DELETED)/*Đã xóa*/)
            {
                return new ApiErrorResult<UserVm>("Người dùng không tồn tại");
            }

            var result = _mapper.Map<UserVm>(user);
            var roles = await _userManager.GetRolesAsync(user);
            result.UserInRole = roles[0];

            return await Task.FromResult(new ApiSuccessResult<UserVm>(result));
        }

        public async Task<ApiResult<List<UserVm>>> GetAllAsync()
        {
            var users = await _context.Users
                .Where(x => x.Status != UserStatus.DELETED)
                .ToListAsync();

            if (users is null)
            {
                return new ApiErrorResult<List<UserVm>>("Không tìm thấy được người dùng nào.");
            }

            var result = _mapper.Map<List<UserVm>>(users);

            for (int i = 0; i < users.Count; i++)
            {
                var role = await _userManager.GetRolesAsync(users[i]);

                result[i].UserInRole = role[0];
            }

            return await Task.FromResult(new ApiSuccessResult<List<UserVm>>(result));
        }

        public async Task<ApiResult<List<LoginHistoryVm>>> GetLoginHistoryAsync(int m, int y)
        {
            var listLoginHistory = _context.Roles.Where(r => r.Name.Equals("User"))
                .Join(_context.UserRoles, r => r.Id, ur => ur.RoleId, (r, ur) => new { r, ur })
                .Join(_context.Users, @t => @t.ur.UserId, u => u.Id, (@t, u) => new { @t, u })
                .Join(_context.LoginHistories, @t => @t.u.Id, lh => lh.UserId, (@t, lh) => new { @t, lh })
                .Where(@t => @t.lh.AccessTime.Month.Equals(m) && @t.lh.AccessTime.Year.Equals(y))
                .GroupBy(@t => new { @t.@t.u.Id, @t.@t.u.UserName, @t.@t.u.Email }, @t => @t.lh)
                .OrderByDescending(x => x.Count())
                .Select(list => new
                {
                    userId = list.Key.Id,
                    userName = list.Key.UserName,
                    email = list.Key.Email,
                    quatity = list.Count()
                });

            var result = new List<LoginHistoryVm>();
            foreach (var lh in listLoginHistory)
            {
                result.Add(new LoginHistoryVm
                {
                    UserId = lh.userId,
                    Username = lh.userName,
                    Email = lh.email,
                    Quantity = lh.quatity
                });
            }

            return await Task.FromResult(new ApiSuccessResult<List<LoginHistoryVm>>(result));
        }

        public async Task<ApiResult<string>> EnableAccountAsync(int userId)
        {
            var user = await _userManager.FindByIdAsync(userId.ToString());

            if (user is null || (user.Status == UserStatus.DELETED))
            {
                return new ApiErrorResult<string>("Người dùng không tồn tại");
            }

            user.Status = UserStatus.ACTIVE;
            user.ModifiedBy = _httpContextAccessor.HttpContext.User.Identity.Name;
            user.ModifiedDate = DateTime.Now;

            await _userManager.UpdateAsync(user);

            return await Task.FromResult(new ApiSuccessResult<string>("Kích hoạt tài khoản thành công"));
        }

        public async Task<ApiResult<List<UserRole>>> GetAllRoleAsync()
        {
            var roles = await _context.UserRoles
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<UserRole>>(roles));
        }
    }
}