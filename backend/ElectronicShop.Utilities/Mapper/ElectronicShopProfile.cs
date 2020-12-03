using AutoMapper;
using ElectronicShop.Application.Users.Commands.CreateUser;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;
using System.Collections.Generic;

namespace ElectronicShop.Utilities.Mapper
{
    public class ElectronicShopProfile : Profile
    {
        public ElectronicShopProfile()
        {
            CreateMap<CreateUserCommand, User>();

            CreateMap<User, UserVm>();
        }
    }
}