using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.FilterProduct
{
    public class SearchProductQuery : IRequest<ApiResult<List<Product>>>
    {
        public string KeyWord { get; set; }
    }
    
    public class SearchProductHandle : IRequestHandler<SearchProductQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _productService;

        public SearchProductHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<List<Product>>> Handle(SearchProductQuery request, CancellationToken cancellationToken)
        {
            return await _productService.SearchAsync(request);
        }
    }
}