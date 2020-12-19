using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetProductById
{
    public class GetProductByIdQuery : IRequest<ApiResult<ProductVm>>
    {
        public GetProductByIdQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class GetProductByIdHandle: IRequestHandler<GetProductByIdQuery, ApiResult<ProductVm>>
    {
        private readonly IProductService _productService;

        public GetProductByIdHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<ProductVm>> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetProductByIdAsync(request.ProductId);
        }
    }
}