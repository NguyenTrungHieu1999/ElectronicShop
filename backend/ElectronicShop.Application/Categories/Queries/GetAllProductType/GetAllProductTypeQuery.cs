using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Categories.Queries.GetAllProductType
{
    public class GetAllProductTypeQuery : IRequest<ApiResult<List<ProductType>>>
    {
        
    }
    
    public class GetAllProductTypeHandle : IRequestHandler<GetAllProductTypeQuery, ApiResult<List<ProductType>>>
    {
        private readonly ICategoryService _category;

        public GetAllProductTypeHandle(ICategoryService category)
        {
            _category = category;
        }

        public async Task<ApiResult<List<ProductType>>> Handle(GetAllProductTypeQuery request, CancellationToken cancellationToken)
        {
            return await _category.GetAllProductTypeAsync();
        }
    }
}