using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Queries.GetProductByIdForClient
{
    public class GetProductByIdForClientQuery : IRequest<ApiResult<Product>>
    {
        public int ProductId { get; }

        public GetProductByIdForClientQuery(int productId)
        {
            ProductId = productId;
        }
    }

    public class GetProductByIdForClientHandle : IRequestHandler<GetProductByIdForClientQuery, ApiResult<Product>>
    {
        private readonly IProductService _service;

        public GetProductByIdForClientHandle(IProductService service)
        {
            _service = service;
        }

        public async Task<ApiResult<Product>> Handle(GetProductByIdForClientQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetByIdForClientAsync(request.ProductId);
        }
    }
}
