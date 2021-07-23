using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Commands.CreateReview;
using ElectronicShop.Application.ProductReviews.Commands.EditReview;
using ElectronicShop.Application.ProductReviews.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.ProductReviews.Services
{
    public interface IProductReviewService
    {
        Task<ApiResult<List<ReviewVm>>> GetAllByProductIdAsync(int productId);
        Task<ApiResult<ProductReview>> GetByIdAsync(int reviewId);
        Task<ApiResult<string>> CreateReviewAsync(CreateReviewCommand command);
        Task<ApiResult<string>> DeleteAsync(int reviewId);
        Task<ApiResult<double>> TotalRateAsync(int productId);
        Task<ApiResult<List<ProductReview>>> GetAllAsync();
        Task<ApiResult<string>> EditAsync(EditReviewCommand command);
    }
}