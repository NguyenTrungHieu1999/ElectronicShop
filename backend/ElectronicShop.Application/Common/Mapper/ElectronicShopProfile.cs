using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
using ElectronicShop.Application.Products.Models;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using System;

namespace ElectronicShop.Application.Common.Mapper
{
    public class ElectronicShopProfile : Profile
    {
        public ElectronicShopProfile()
        {

            CreateMap<CreateUserCommand, User>();
            
            CreateMap<User, UserVm>()
                .ForMember(dest => dest.Birthday, opt => opt.MapFrom(src => DateTime.Parse(src.Birthday.ToString(), System.Globalization.CultureInfo.InvariantCulture).ToString()));

            CreateMap<CreateCategoryCommand, Category>();

            CreateMap<Category, CategoryVm>();

            CreateMap<CreateProductCommand, Product>();

            CreateMap<Product, ProductVm>();
        }
    }
}