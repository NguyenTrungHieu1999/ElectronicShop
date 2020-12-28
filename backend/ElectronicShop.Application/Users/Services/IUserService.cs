﻿using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Services
{
    public interface IUserService
    {
        Task<ApiResult<string>> CreateAsync(CreateUserCommand request);

        Task<ApiResult<string>> UpdateAsync(UpdateUserCommand request);

        Task<ApiResult<string>> DeleteAsync(int userId);

        Task<ApiResult<string>> DisableAccountAsync(int userId);

        Task<ApiResult<UserVm>> GetByIdAsync(int userId);

        Task<ApiResult<List<UserVm>>> GetAllAsync();
    }
}
