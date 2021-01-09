using System.Collections.Generic;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.ProductReviews.Services
{
    public interface IProductReviewService
    {
        Task<ApiResult<List<ProductReview>>> GetAllAsync();
    }
}