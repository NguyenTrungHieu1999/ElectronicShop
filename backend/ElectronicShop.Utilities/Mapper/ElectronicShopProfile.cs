using AutoMapper;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Utilities.Mapper
{
    public class ElectronicShopProfile : Profile
    {
        public ElectronicShopProfile()
        {
            CreateMap<UserRegisterRequest, User>();
        }
    }
}