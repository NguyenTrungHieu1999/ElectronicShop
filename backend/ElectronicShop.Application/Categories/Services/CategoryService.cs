using AutoMapper;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Categories.Extensions;
using ElectronicShop.Application.Common.Models;
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
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;

        public CategoryService(IMapper mapper, IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context)
        {
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
                await _context.Categories.AddAsync(category);

                await _context.SaveChangesAsync();
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
                var category = await _context.Categories.FindAsync(request.Id);

                category.Map(request);

                category.ModifiedBy = username;

                _context.Categories.Update(category);

                await _context.SaveChangesAsync();
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<string>("Cập nhật danh mục sản phẩm thất bại"));
            }
            
            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật danh mục sản phẩm thành công"));
        }

        public async Task<ApiResult<Category>> GetByIdAsync(int id)
        {
            var category = await _context.Categories
                .Include(x=>x.Products)
                .Include(x => x.ProductType)
                .SingleOrDefaultAsync(x => x.Id == id);

            return await Task.FromResult(new ApiSuccessResult<Category>(category));
        }

        public async Task<ApiResult<List<Category>>> GetAllAsync()
        {
            var categories = await _context.Categories
                .Include(x => x.ProductType)
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Category>>(categories));
        }

        public async Task<ApiResult<List<ProductType>>> GetAllProductTypeAsync()
        {
            var productType = await _context.ProductTypes.ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<ProductType>>(productType));
        }
    }
}