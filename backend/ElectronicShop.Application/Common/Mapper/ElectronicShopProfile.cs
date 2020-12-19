using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Models;
<<<<<<< HEAD
using ElectronicShop.Application.Products.Commands.CreateProduct;
<<<<<<< HEAD
using ElectronicShop.Application.Products.Models;
=======
>>>>>>> parent of dfe0bd1... fix bugs
=======
>>>>>>> parent of 0fd6cc0... temp
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;

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
<<<<<<< HEAD

            CreateMap<CreateProductCommand, Product>();
<<<<<<< HEAD

            CreateMap<Product, ProductVm>();
=======
>>>>>>> parent of dfe0bd1... fix bugs
=======
>>>>>>> parent of 0fd6cc0... temp
        }
    }
}