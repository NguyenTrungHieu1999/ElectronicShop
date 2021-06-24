using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Products.Queries.GetNewProducts
{
    public class GetNewProductsQuery : IRequest<ApiResult<List<Product>>>
    { }
    
    public class GetNewProductsHandle: IRequestHandler<GetNewProductsQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _service;

        public GetNewProductsHandle(IProductService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<Product>>> Handle(GetNewProductsQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetNewProductsAsync();
        }
    }
}