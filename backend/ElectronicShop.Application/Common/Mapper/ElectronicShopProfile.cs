using AutoMapper;
using ElectronicShop.Application.Authentications.Commands.ExternalLogins;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Comments.Commands.CreateComment;
using ElectronicShop.Application.Comments.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Application.Orders.Commands.EmpCreateOrder;
using ElectronicShop.Application.ProductPhotos.Models;
using ElectronicShop.Application.ProductReviews.Commands.CreateReview;
using ElectronicShop.Application.ProductReviews.Models;
using ElectronicShop.Application.Products.Commands.CreateProduct;
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

            CreateMap<ExternalLoginsCommand, User>();

            CreateMap<CreateCategoryCommand, Category>();

            CreateMap<CreateProductCommand, Product>();

            CreateMap<ProductPhoto, PhotoVm>();

            CreateMap<CreateOrderCommand, Order>()
                .ForMember(dest => dest.OrderDetails, act => act.Ignore());

            CreateMap<CreateReviewCommand, ProductReview>();

            CreateMap<CreateCommentCommand, Comment>();

            CreateMap<ProductReview, ReviewVm>();

            CreateMap<Comment, CommentVm>();

            CreateMap<EmpCreateOrderCommand, Order>()
                 .ForMember(dest => dest.OrderDetails, act => act.Ignore());
        }
    }
}