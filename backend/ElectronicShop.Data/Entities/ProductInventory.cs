using System;
using System.Collections.Generic;
using System.Text;

namespace ElectronicShop.Data.Entities
{
    public class ProductInventory
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int GoodsReceipt { get; set; }//Số lượng nhập
        public decimal CostPrice { get; set; }//Giá vốn
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Product Product { get; set; }
        public User User { get; set; }
    }
}
