using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetProductById
{
    public class GetProductByIdQuery : IRequest<ApiResult<Product>>
    {
        public GetProductByIdQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class GetProductByIdHandle: IRequestHandler<GetProductByIdQuery, ApiResult<Product>>
    {
        private readonly IProductService _productService;

        public GetProductByIdHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<Product>> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetProductByIdAsync(request.ProductId);
        }
    }
}