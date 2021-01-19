using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetAllProduct
{
    public class GetAllProductQuery : IRequest<ApiResult<List<Product>>>
    {
    }
    
    public class GetAllProductHandle:IRequestHandler<GetAllProductQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _productService;

        public GetAllProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<List<Product>>> Handle(GetAllProductQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetAllProductAsync();
        }
    }
}