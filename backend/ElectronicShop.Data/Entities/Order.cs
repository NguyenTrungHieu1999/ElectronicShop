using System;
using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class Order
    {
        public int Id { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime DeliveryDate { get; set; }//Ngày giao dự kiến

        public bool Paid { get; set; }//Đã thanh toán

        public string Receiver { get; set; }

        public string ReceiversAddress { get; set; }

        public string PhoneNumber { get; set; }
        
        public string Email { get; set; }

        public string Note { get; set; }

        public decimal TotalMoney { get; set; }

        public int StatusId { get; set; }

        public bool Received { get; set; }

        public int? UserId { get; set; }

        public User User { get; set; }

        public OrderStatus OrderStatus { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }

        public List<OrderStatusDetail> OrderStatusDetails { get; set; }
    }
}
