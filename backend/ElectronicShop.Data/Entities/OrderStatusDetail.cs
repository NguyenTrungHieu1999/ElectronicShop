using System;

namespace ElectronicShop.Data.Entities
{
    public class OrderStatusDetail
    {
        public int Id { get; set; }

        public int StatusId { get; set; }

        public int OrderId { get; set; }

        public int? EmpId { get; set; }

        public DateTime CreatedDate { get; set; }

        public Order Order { get; set; }

        public OrderStatus OrderStatus { get; set; }

        public User User { get; set; }
    }
}
