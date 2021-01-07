using System;
using System.Collections.Generic;
using ElectronicShop.Data.Entities;
using ElectronicShop.Data.Enums;

namespace ElectronicShop.Application.Products.Models
{
    public class ProductVm
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
        
        public List<ProductPhoto> ProductPhotos { get; set; }
    }
}