using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Categories.Commands.UpdateCategory
{
    public class UpdateCategoryCommand : IRequest<ApiResult<string>>
    {
        public int Id { get; set; }
        
        public string Name { get; set; }
        
        public string Alias { get; set; }
        
        public int? RootId { get; set; }
        
        public int ProductTypeId { get; set; }
    }

    public class UpdateCategoryHandle : IRequestHandler<UpdateCategoryCommand, ApiResult<string>>
    {
        private readonly ICategoryService _categoryService;

        public UpdateCategoryHandle(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<ApiResult<string>> Handle(UpdateCategoryCommand request, CancellationToken cancellationToken)
        {
            return await _categoryService.UpdateAsync(request);
        }
    }
}