using ElectronicShop.Application.Common.Models;
using MediatR;
using Microsoft.AspNetCore.Http;

namespace ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto
{
    public class CreateProductPhotoCommand : IRequest<ApiResult<string>>
    {
        public int ProductId { get; set; }
        
        public bool IsDefault { get; set; }
        
        public IFormFile ThumbnailImage { get; set; }
    }
}