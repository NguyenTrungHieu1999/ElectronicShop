using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Commands.DeleteReview
{
    public class DeleteReviewCommand : IRequest<ApiResult<string>>
    {
        public DeleteReviewCommand(int reviewId)
        {
            ReviewId = reviewId;
        }

        public int ReviewId { get; }
    }
    
    public class DeleteReviewHandle : IRequestHandler<DeleteReviewCommand, ApiResult<string>>
    {
        private readonly IProductReviewService _productReviewService;

        public DeleteReviewHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<string>> Handle(DeleteReviewCommand request, CancellationToken cancellationToken)
        {
            return await _productReviewService.DeleteAsync(request.ReviewId);
        }
    }
}