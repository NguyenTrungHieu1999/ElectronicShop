using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Models;
using ElectronicShop.Application.Products.Services;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetAllProduct
{
    public class GetAllProductQuery : IRequest<ApiResult<List<ProductVm>>>
    {
        public decimal? Price { get; set; }
    }
    
    public class GetAllProductHandle:IRequestHandler<GetAllProductQuery, ApiResult<List<ProductVm>>>
    {
        private readonly IProductService _productService;

        public GetAllProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<List<ProductVm>>> Handle(GetAllProductQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetAllProductAsync(request);
        }
    }
}