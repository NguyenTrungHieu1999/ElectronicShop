using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Models;
using ElectronicShop.Application.ProductReviews.Services;
using ElectronicShop.Data.Entities;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Queries.GetAllReviews
{
    public class GetAllReviewsQuery : IRequest<ApiResult<List<ReviewVm>>>
    {
        public GetAllReviewsQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class GetAllReviewHandle : IRequestHandler<GetAllReviewsQuery, ApiResult<List<ReviewVm>>>
    {
        private readonly IProductReviewService _productReviewService;

        public GetAllReviewHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<List<ReviewVm>>> Handle(GetAllReviewsQuery request, CancellationToken cancellationToken)
        {
            return await _productReviewService.GetAllAsync(request.ProductId);
        }
    }
}