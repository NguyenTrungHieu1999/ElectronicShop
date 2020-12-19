using System.Linq;
using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.Common.Mapper
{
    public class ElectronicShopProfile : Profile
    {
        public ElectronicShopProfile()
        {

            CreateMap<CreateUserCommand, User>();
            
            CreateMap<User, UserVm>();

            CreateMap<CreateCategoryCommand, Category>();

            CreateMap<Category, CategoryVm>();

            CreateMap<CreateProductCommand, Product>();

            CreateMap<Product, ProductVm>();
        }
    }
}