using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductPhotos.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.ProductPhotos.Commands.DeleteProductPhoto
{
    public class DeleteProductPhotoCommand : IRequest<ApiResult<string>>
    {
        public DeleteProductPhotoCommand(int productPhotoId)
        {
            ProductPhotoId = productPhotoId;
        }

        public int ProductPhotoId { get; set; }
    }
    
    public class DeleteProductPhotoHandle : IRequestHandler<DeleteProductPhotoCommand, ApiResult<string>>
    {
        private readonly IProductPhotoService _productPhoto;

        public DeleteProductPhotoHandle(IProductPhotoService productPhoto)
        {
            _productPhoto = productPhoto;
        }

        public async Task<ApiResult<string>> Handle(DeleteProductPhotoCommand request, CancellationToken cancellationToken)
        {
            return await _productPhoto.DeleteAsync(request.ProductPhotoId);
        }
    }
}