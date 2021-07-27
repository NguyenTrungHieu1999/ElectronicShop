using ElectronicShop.Data.Enums;
using System;
using System.Collections.Generic;

namespace ElectronicShop.Data.Entities
{
    public class Product
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public decimal Price { get; set; }

        public string Specifications { get; set; }//Thông số kỹ thuật

        public string Description { get; set; }

        public int GoodsReceipt { get; set; }//Số lượng nhập

        public int Inventory { get; set; }//Số lượng tồn

        public ProductStatus Status { get; set; }

        public int CategoryId { get; set; }

        public string Alias { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string CreatedBy { get; set; } //UserName

        public string ModifiedBy { get; set; } //UserName

        public Category Category { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }

        public List<WatchedProduct> WatchedProducts { get; set; }

        public List<ProductReview> ProductReviews { get; set; }

        public List<ProductPhoto> ProductPhotos { get; set; }

        public List<FavoriteProduct> FavoriteProducts { get; set; }

        public List<Cart> Carts { get; set; }

        public List<Comment> Comments { get; set; }

        public List<ProductInventory> ProductInventories { get; set; }
    }
}
