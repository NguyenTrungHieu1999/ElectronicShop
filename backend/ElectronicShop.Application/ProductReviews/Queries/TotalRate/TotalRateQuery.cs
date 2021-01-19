using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.ProductReviews.Services;
using MediatR;

namespace ElectronicShop.Application.ProductReviews.Queries.TotalRate
{
    public class TotalRateQuery : IRequest<ApiResult<double>>
    {
        public TotalRateQuery(int productId)
        {
            ProductId = productId;
        }

        public int ProductId { get; }
    }
    
    public class TotalRateHandle:IRequestHandler<TotalRateQuery, ApiResult<double>>
    {
        private readonly IProductReviewService _productReviewService;

        public TotalRateHandle(IProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        public async Task<ApiResult<double>> Handle(TotalRateQuery request, CancellationToken cancellationToken)
        {
            return await _productReviewService.TotalRateAsync(request.ProductId);
        }
    }
}