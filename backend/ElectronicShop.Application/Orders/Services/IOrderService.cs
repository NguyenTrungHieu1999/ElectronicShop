using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Application.Orders.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Orders.Services
{
    public interface IOrderService
    {
        Task<ApiResult<string>> CreateAsync(CreateOrderCommand command);

        Task<ApiResult<string>> ChangeStatusAsync(int orderId);

        Task<ApiResult<List<OrderVm>>> GetAllAsync();

        Task<ApiResult<List<OrderVm>>> GetOrderByUserId();
    }
}
