using ElectronicShop.Application.Products.Commands.UpdateProduct;
using ElectronicShop.Data.Entities;
using System;

namespace ElectronicShop.Application.Products.Extensions
{
    public static class ProductExtensions
    {
        public static void Map(this Product product, UpdateProductCommand update)
        {
            product.Name = update.Name;

            product.Price = update.Price;

            product.Specifications = update.Specifications;

            product.Description = update.Description;

            product.GoodsReceipt = update.GoodsReceipt;

            product.Inventory = update.Inventory;

            product.Status = update.Status;

            product.CategoryId = update.CategoryId;

            product.ModifiedDate = DateTime.Now;
        }
    }
}
