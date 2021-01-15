using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Commands.CreateReview
{
    public class CreateReviewCommand : IRequest<ApiResult<string>>
    {
        // public int UserId { get; set; }

        public int ProductId { get; set; }

        public double RateStar { get; set; }

        public string Text { get; set; }

        // public DateTime CreateDate { get; set; }

        // public bool Status { get; set; }

    }
    
    public class CreateReviewHandle : IRequestHandler<CreateReviewCommand, ApiResult<string>>
    {
        private readonly IProductReviewService _productReviewService;

        public CreateReviewHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<string>> Handle(CreateReviewCommand request, CancellationToken cancellationToken)
        {
            return await _productReviewService.CreateReviewAsync(request);
        }
    }
}