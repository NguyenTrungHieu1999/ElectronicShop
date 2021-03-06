﻿using MediatR;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Services;
using ElectronicShop.Application.Common.Models;
using System.ComponentModel.DataAnnotations;

namespace ElectronicShop.Application.Categories.Commands.CreateCategory
{
    public class CreateCategoryCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public string Name { get; set; }
        
        [Required]
        public string Alias { get; set; }
        
        public int? RootId { get; set; }
        
        [Required]
        public int ProductTypeId { get; set; }
    }

    public class CreateCategoryHandle : IRequestHandler<CreateCategoryCommand, ApiResult<string>>
    {
        private readonly ICategoryService _categoryService;

        public CreateCategoryHandle(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public async Task<ApiResult<string>> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
        {
            return await _categoryService.CreateAsync(request);
        }
    }
}