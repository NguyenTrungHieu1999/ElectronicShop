using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class OrderStatus
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public List<Order> Orders { get; set; }

        public List<OrderStatusDetail> OrderStatusDetails { get; set; }
    }
}
