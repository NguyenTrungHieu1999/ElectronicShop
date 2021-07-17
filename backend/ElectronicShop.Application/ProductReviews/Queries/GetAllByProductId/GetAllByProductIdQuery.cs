using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Models;
using ElectronicShop.Application.ProductReviews.Services;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Queries.GetAllByProductId
{
    public class GetAllByProductIdQuery : IRequest<ApiResult<List<ReviewVm>>>
    {
        public GetAllByProductIdQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }

    public class GetAllByProductIdHandle : IRequestHandler<GetAllByProductIdQuery, ApiResult<List<ReviewVm>>>
    {
        private readonly IProductReviewService _productReviewService;

        public GetAllByProductIdHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<List<ReviewVm>>> Handle(GetAllByProductIdQuery request, CancellationToken cancellationToken)
        {
            return await _productReviewService.GetAllByProductIdAsync(request.ProductId);
        }
    }
}