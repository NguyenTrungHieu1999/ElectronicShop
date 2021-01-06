using System.Collections.Generic;
using ElectronicShop.Application.Common.Models;
using MediatR;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.ProductPhotos.Services;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.ProductPhotos.Commands.CreateProductPhoto
{
    public class CreateProductPhotoCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public int ProductId { get; set; }

        [Required]
        public List<IFormFile> ThumbnailImages { get; set; }
    }
    
    public class CreateProductPhotoHandle:IRequestHandler<CreateProductPhotoCommand, ApiResult<string>>
    {
        private readonly IProductPhotoService _productPhoto;

        public CreateProductPhotoHandle(IProductPhotoService productPhoto)
        {
            _productPhoto = productPhoto;
        }

        public async Task<ApiResult<string>> Handle(CreateProductPhotoCommand request, CancellationToken cancellationToken)
        {
            return await _productPhoto.CreateProductPhoto(request);
        }
    }
}