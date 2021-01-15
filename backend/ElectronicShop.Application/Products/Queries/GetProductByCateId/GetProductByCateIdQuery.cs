using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetProductByCateId
{
    public class GetProductByCateIdQuery : IRequest<ApiResult<List<Product>>>
    {
        public GetProductByCateIdQuery(int categoryId)
        {
            CategoryId = categoryId;
        }

        public int CategoryId { get; }
        
    }
    
    public class GetProductByCateIdHandle : IRequestHandler<GetProductByCateIdQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _productService;

        public GetProductByCateIdHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<List<Product>>> Handle(GetProductByCateIdQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetByCateIdAsync(request.CategoryId);
        }
    }
}