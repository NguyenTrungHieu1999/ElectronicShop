using ElectronicShop.Application.OrderDetails.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.OrderDetails.Extensions
{
    public static class OrderDetailExtensions
    {
        public static void Map(this OrderDetail orderDetail, OrderDetailVm orderDetailVm)
        {
            orderDetail.Price = orderDetailVm.Price;

            orderDetail.Quantity = orderDetailVm.Quantity;

            orderDetail.ProductId = orderDetailVm.ProductId;
        }
    }
}