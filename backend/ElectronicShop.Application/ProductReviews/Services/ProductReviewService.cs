using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Commands.CreateReview;
using ElectronicShop.Application.ProductReviews.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace ElectronicShop.Application.ProductReviews.Services
{
    public class ProductReviewService : IProductReviewService
    {
        private readonly ElectronicShopDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IMapper _mapper;

        public ProductReviewService(ElectronicShopDbContext context, IHttpContextAccessor httpContextAccessor, IMapper mapper)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
            _mapper = mapper;
        }

        public async Task<ApiResult<List<ReviewVm>>> GetAllAsync(int productId)
        {
            var reviews = await _context.ProductReviews
                .Where(x=>x.Status == true && x.ProductId.Equals(productId))
                .ToListAsync();

            var result = _mapper.Map<List<ReviewVm>>(reviews);

            foreach (var review in result)
            {
                review.UserName = (await _context.Users.FindAsync(review.UserId)).UserName;
            }

            return await Task.FromResult(new ApiSuccessResult<List<ReviewVm>>(result));
        }

        public async Task<ApiResult<ProductReview>> GetByIdAsync(int reviewId)
        {
            var review = await _context.ProductReviews
                .SingleOrDefaultAsync(x=>x.Id == reviewId && x.Status == true);

            return await Task.FromResult(new ApiSuccessResult<ProductReview>(review));
        }

        public async Task<ApiResult<string>> CreateReviewAsync(CreateReviewCommand command)
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value;

            var review = _mapper.Map<ProductReview>(command);
            
            review.UserId = int.Parse(userId);
            review.CreateDate = DateTime.Now;
            review.Status = true;
            
            await _context.AddAsync(review);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm đánh giá thành công!"));
        }

        public async Task<ApiResult<string>> DeleteAsync(int reviewId)
        {
            var review = await _context.ProductReviews.FindAsync(reviewId);

            if (review is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy đánh giá."));
            }

            review.Status = false;
            _context.ProductReviews.Update(review);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa đánh giá thành công."));
        }

        public async Task<ApiResult<double>> TotalRateAsync(int productId)
        {
            var rates = await _context.ProductReviews.Where(x => x.ProductId.Equals(productId))
                .ToListAsync();

            if (rates.Count == 0)
            {
                return await Task.FromResult(new ApiErrorResult<double>("Không có đánh giá."));
            }
            else
            {
                var totalRate = await _context.ProductReviews
                    .Where(x=>x.ProductId.Equals(productId))
                    .AverageAsync(x => x.RateStar);

                return await Task.FromResult(new ApiSuccessResult<double>(totalRate));   
            }
        }
    }
}