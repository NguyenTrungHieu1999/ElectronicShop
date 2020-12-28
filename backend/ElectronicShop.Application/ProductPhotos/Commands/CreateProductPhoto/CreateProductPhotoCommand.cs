using ElectronicShop.Application.Common.Models;
using MediatR;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto
{
    public class CreateProductPhotoCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public int ProductId { get; set; }
        
        public bool IsDefault { get; set; }
        
        [Required]
        public IFormFile ThumbnailImage { get; set; }
    }
}