using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
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
        }
    }
}