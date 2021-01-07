using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Models;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Categories.Queries.GetAllCategory
{
    public class GetAllCategoryQuery : IRequest<ApiResult<List<CategoryVm>>>
    {
        
    }

    public class GetAllCategoryHandle : IRequestHandler<GetAllCategoryQuery, ApiResult<List<CategoryVm>>>
    {
        private readonly ICategoryService _categoryService;

        public GetAllCategoryHandle(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<ApiResult<List<CategoryVm>>> Handle(GetAllCategoryQuery request, CancellationToken cancellationToken)
        {
            return await _categoryService.GetAll();
        }
    }
}