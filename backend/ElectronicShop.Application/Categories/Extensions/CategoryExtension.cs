using System;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Categories.Extensions
{
    public static class CategoryExtension
    {
        public static void Map(this Category category, UpdateCategoryCommand request)
        {
            category.Name = request.Name;

            category.Alias = request.Alias;

            category.RootId = request.RootId;

            category.ProductTypeId = request.ProductTypeId;
            
            category.ModifiedDate = DateTime.Now;
        }
    }
}