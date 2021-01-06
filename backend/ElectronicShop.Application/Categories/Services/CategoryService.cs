using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Categories.Extensions;
using ElectronicShop.Application.Categories.Models;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Common.Repositories.Wrapper;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Categories.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly IRepositoryWrapper _repository;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;

        public CategoryService(IRepositoryWrapper repository, IMapper mapper, 
            IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
            _repository = repository;
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _context = context;
        }

        public async Task<ApiResult<string>> CreateAsync(CreateCategoryCommand request)
        {
            var username = _httpContextAccessor.HttpContext.User.Identity.Name;
            
            var category = _mapper.Map<Category>(request);
            
            category.CreatedDate = DateTime.Now;

            category.CreatedBy = username;

            try
            {
                await _repository.CategoryRepository.CreateAsync(category);

                await _repository.SaveChangesAsync();
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<string>("Thêm danh mục sản phẩm thất bại"));
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm danh mục sản phẩm thành công"));
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateCategoryCommand request)
        {
            var username = _httpContextAccessor.HttpContext.User.Identity.Name;

            try
            {
                var category = await _repository.CategoryRepository.FindByIdAsync(request.Id);

                category.Map(request);

                category.ModifiedBy = username;

                _repository.CategoryRepository.Update(category);

                await _repository.SaveChangesAsync();
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<string>("Cập nhật danh mục sản phẩm thất bại"));
            }
            
            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật danh mục sản phẩm thành công"));
        }

        public async Task<ApiResult<CategoryVm>> GetById(int id)
        {
            var category = await _context.Categories
                .Include(x => x.ProductType)
                .SingleOrDefaultAsync(x => x.Id == id);

            var result = _mapper.Map<CategoryVm>(category);

            return await Task.FromResult(new ApiSuccessResult<CategoryVm>(result));
        }

        public async Task<ApiResult<List<CategoryVm>>> GetAll()
        {
            var categories = await _context.Categories
                .Include(x => x.ProductType)
                .ToListAsync();

            var result = _mapper.Map<List<CategoryVm>>(categories);

            return await Task.FromResult(new ApiSuccessResult<List<CategoryVm>>(result));
        }
    }
}