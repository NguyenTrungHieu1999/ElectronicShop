using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Commands.UpdateUser;
using ElectronicShop.Application.Users.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Services
{
    public interface IUserService
    {
        Task<ApiResult<bool>> CreateAsync(CreateUserCommand request);

        Task<ApiResult<bool>> UpdateAsync(UpdateUserCommand request);

        Task<ApiResult<bool>> DeleteAsync(int userId);

        Task<ApiResult<bool>> DisableAccountAsync(int userId);

        Task<ApiResult<UserVm>> GetByIdAsync(int userId);

        Task<ApiResult<List<UserVm>>> GetAllAsync();
    }
}
