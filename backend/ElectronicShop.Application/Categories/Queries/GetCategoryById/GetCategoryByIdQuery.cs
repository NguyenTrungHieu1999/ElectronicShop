using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.Categories.Queries.GetCategoryById
{
    public class GetCategoryByIdQuery : IRequest<ApiResult<Category>>
    {
        public GetCategoryByIdQuery(int id)
        {
            Id = id;
        }

        public int Id { get; }
    }

    public class GetCategoryByIdHandle : IRequestHandler<GetCategoryByIdQuery, ApiResult<Category>>
    {
        private readonly ICategoryService _categoryService;

        public GetCategoryByIdHandle(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<ApiResult<Category>> Handle(GetCategoryByIdQuery request, CancellationToken cancellationToken)
        {
            return await _categoryService.GetByIdAsync(request.Id);
        }
    }
}