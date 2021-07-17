using ElectronicShop.Data.Entities;
using System;
using System.Collections.Generic;

namespace ElectronicShop.Application.Orders.Models
{
    public class OrderVm
    {
        public int OrderId { get; set; }
        public decimal TotalPrice { get; set; }
        public string OrderStatus { get; set; }
        public int StatusId { get; set; }
        public string Receiver { get; set; }
        public string ReceiversAddress { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime DeliveryDate { get; set; }//Ngày giao dự kiến
        public bool Received { get; set; }
        public string PaymentMethod { get; set; }
        public List<ListProduct> Products { get; set; }
        public List<OrderStatusDetail> OrderStatusDetails { get; set; }
    }

    public class ListProduct
    {
        public int ProductId { get; set; }
        public int Inventory { get; set; }
        public string Alias { get; set; }
        public int CateId { get; set; }
        public string ProductName { get; set; }
        public string ProductPhoto { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}