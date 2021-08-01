using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Users.Services;
using ElectronicShop.Data.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace ElectronicShop.Application.Users.Queries.GetAllRole
{
    public class GetAllRoleQuery : IRequest<ApiResult<List<UserRole>>>
    {
    }

    public class GetAllRoleHandle : IRequestHandler<GetAllRoleQuery, ApiResult<List<UserRole>>>
    {
        private readonly IUserService _service;

        public GetAllRoleHandle(IUserService service)
        {
            _service = service;
        }

        public async Task<ApiResult<List<UserRole>>> Handle(GetAllRoleQuery request, CancellationToken cancellationToken)
        {
            return await _service.GetAllRoleAsync();
        }
    }
}
