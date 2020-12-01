using AutoMapper;
using ElectronicShop.Application.Users.Command;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Utilities.Mapper
{
    public class ElectronicShopProfile : Profile
    {
        public ElectronicShopProfile()
        {
            CreateMap<RegisterUserCommand, User>();
        }
    }
}