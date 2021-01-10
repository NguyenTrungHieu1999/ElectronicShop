﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.ProductReviews.Services
{
    public class ProductReviewService : IProductReviewService
    {
        private readonly ElectronicShopDbContext _context;

        public ProductReviewService(ElectronicShopDbContext context)
        {
            _context = context;
        }

        public async Task<ApiResult<List<ProductReview>>> GetAllAsync()
        {
            var reviews = await _context.ProductReviews
                .Where(x=>x.Status == true)
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<ProductReview>>(reviews));
        }

        public async Task<ApiResult<ProductReview>> GetByIdAsync(int reviewId)
        {
            var review = await _context.ProductReviews
                .SingleOrDefaultAsync(x=>x.Id == reviewId && x.Status == true);

            return await Task.FromResult(new ApiSuccessResult<ProductReview>(review));
        }
    }
}