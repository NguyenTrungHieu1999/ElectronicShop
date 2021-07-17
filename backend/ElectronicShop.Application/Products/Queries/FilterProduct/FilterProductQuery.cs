using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Products.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Products.Queries.FilterProduct
{
    public class FilterProductQuery : IRequest<ApiResult<List<Product>>>
    {
        public int Sorted { get; set; }
        public int Price { get; set; }
    }

    public class FilterProductHandle : IRequestHandler<FilterProductQuery, ApiResult<List<Product>>>
    {
        private readonly IProductService _service;

        public FilterProductHandle(IProductService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<Product>>> Handle(FilterProductQuery request, CancellationToken cancellationToken)
        {
            return await _service.FilterAsync(request);
        }
    }
}
