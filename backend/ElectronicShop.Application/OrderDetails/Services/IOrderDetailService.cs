using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.OrderDetails.Services
{
    public interface IOrderDetailService
    {
        Task<ApiResult<List<OrderDetail>>> GetOrderDetailByOrderIdAsync(int orderId);
    }
}