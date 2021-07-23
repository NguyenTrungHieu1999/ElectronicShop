using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.ProductReviews.Commands.EditReview
{
    public class EditReviewCommand : IRequest<ApiResult<string>>
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public double RateStar { get; set; }
    }

    public class EditReviewHandle : IRequestHandler<EditReviewCommand, ApiResult<string>>
    {
        private readonly IProductReviewService _service;

        public EditReviewHandle(IProductReviewService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(EditReviewCommand request, CancellationToken cancellationToken)
        {
            return await _service.EditAsync(request);
        }
    }
}
