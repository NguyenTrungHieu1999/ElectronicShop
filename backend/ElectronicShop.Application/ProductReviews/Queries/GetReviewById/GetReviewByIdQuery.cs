using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Queries.GetReviewById
{
    public class GetReviewByIdQuery : IRequest<ApiResult<ProductReview>>
    {
        public GetReviewByIdQuery(int productReviewId)
        {
            ProductReviewId = productReviewId;
        }

        public int ProductReviewId { get; }
    }
    
    public class GetReviewByIdHandle : IRequestHandler<GetReviewByIdQuery, ApiResult<ProductReview>>
    {
        private readonly IProductReviewService _productReviewService;

        public GetReviewByIdHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<ProductReview>> Handle(GetReviewByIdQuery request, CancellationToken cancellationToken)
        {
            return await _productReviewService.GetByIdAsync(request.ProductReviewId);
        }
    }
}