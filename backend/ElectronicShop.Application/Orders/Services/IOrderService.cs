using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Services
{
    public interface IOrderService
    {
        Task<ApiResult<string>> CreateAsync(CreateOrderCommand command);

        Task<ApiResult<string>> ChangeStatusAsync(int orderId);

        Task<ApiResult<List<Order>>> GetAllAsync();

        Task<ApiResult<List<Order>>> GetOrderByUserIdAsync();

        Task<ApiResult<Order>> GetOrderByIdAsync(int orderId);

        Task<ApiResult<Order>> MyOrderByIdAsync(int orderId);

        Task<ApiResult<string>> CancleOrderAsync(int orderId);

        Task<ApiResult<string>> CancleMyOrderAsync(int orderId);
    }
}
