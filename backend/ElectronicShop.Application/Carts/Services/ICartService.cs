using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Commands.AddCart;
using ElectronicShop.Application.Carts.Commands.UpdateCart;
using ElectronicShop.Application.Carts.Models;
using ElectronicShop.Application.Carts.Queries;
using ElectronicShop.Application.Common.Models;

namespace ElectronicShop.Application.Carts.Services
{
    public interface ICartService
    {
        Task<ApiResult<string>> CreateAsync(List<CartModel> models);
        Task<ApiResult<List<CartVm>>> GetAllAsync();
        Task<ApiResult<string>> UpdateAsync(UpdateCartCommand command);
        Task<ApiResult<string>> AddAsync(AddCartCommand command);
        Task<ApiResult<string>> RemoveAllCart();
    }
}