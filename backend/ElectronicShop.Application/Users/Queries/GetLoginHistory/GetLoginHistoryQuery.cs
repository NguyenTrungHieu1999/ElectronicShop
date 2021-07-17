using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Models;
using ElectronicShop.Application.Users.Services;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Queries.GetLoginHistory
{
    public class GetLoginHistoryQuery : IRequest<ApiResult<List<LoginHistoryVm>>>
    {
        public int Month { get; set; }
        public int Year { get; set; }
    }

    public class GetLoginHistoryHandle : IRequestHandler<GetLoginHistoryQuery, ApiResult<List<LoginHistoryVm>>>
    {
        private readonly IUserService _service;

        public GetLoginHistoryHandle(IUserService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<LoginHistoryVm>>> Handle(GetLoginHistoryQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetLoginHistoryAsync(request.Month, request.Year);
        }
    }
}
