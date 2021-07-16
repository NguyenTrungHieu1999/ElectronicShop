using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Queries.GetAllProductForClient
{
    public class GetAllProductForClientQuery: IRequest<ApiResult<List<Product>>>
    {

    }

    public class GetAllProductForClientHandle : IRequestHandler<GetAllProductForClientQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _productService;

        public GetAllProductForClientHandle(IProductService productService)
        {
            _productService = productService;
        }

        public async Task<ApiResult<List<Product>>> Handle(GetAllProductForClientQuery request, CancellationToken cancellationToken)
        {
            return await _productService.GetAllForClienttAsync();
        }
    }
}
