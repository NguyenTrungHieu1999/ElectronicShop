using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Orders.Commands.EmpCreateOrder;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Services
{
    public interface IOrderService
    {
        Task<ApiResult<Order>> CreateAsync(CreateOrderCommand command);
        Task<ApiResult<Order>> EmpCreateAsync(EmpCreateOrderCommand command);
        Task<ApiResult<Order>> ChangeStatusAsync(int orderId);
        Task<ApiResult<List<Order>>> GetAllAsync();
        Task<ApiResult<List<List<OrderVm>>>> GetOrderByUserIdAsync();
        Task<ApiResult<Order>> GetOrderByIdAsync(int orderId);
        Task<ApiResult<Order>> MyOrderByIdAsync(int orderId);
        Task<ApiResult<Order>> CancleOrderAsync(int orderId);
        Task<ApiResult<string>> CancleMyOrderAsync(int orderId);
        Task<ApiResult<List<SellingProductsVM>>> SellingProducts(int m, int y);
    }
}
