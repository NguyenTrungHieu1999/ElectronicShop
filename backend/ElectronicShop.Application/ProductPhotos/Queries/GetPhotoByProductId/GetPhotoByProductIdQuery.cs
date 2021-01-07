using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductPhotos.Models;
using ElectronicShop.Application.ProductPhotos.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.ProductPhotos.Queries.GetPhotoByProductId
{
    public class GetPhotoByProductIdQuery : IRequest<ApiResult<List<PhotoVm>>>
    {
        public int ProductId { get; set; }

        public GetPhotoByProductIdQuery(int productId)
        {
            ProductId = productId;
        }
    }

    public class GetPhotoByProductIdHandle : IRequestHandler<GetPhotoByProductIdQuery, ApiResult<List<PhotoVm>>>
    {
        private readonly IProductPhotoService _productPhoto;

        public GetPhotoByProductIdHandle(IProductPhotoService productPhoto)
        {
            _productPhoto = productPhoto;
        }

        public async Task<ApiResult<List<PhotoVm>>> Handle(GetPhotoByProductIdQuery request, CancellationToken cancellationToken)
        {
            return await _productPhoto.GetByProductId(request.ProductId);
        }
    }
}
