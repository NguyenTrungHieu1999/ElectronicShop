using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Services;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Carts.Commands.UpdateCart
{
    public class UpdateCartCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public int ProductId { get; set; }

        [Required]
        public int Total { get; set; }
    }
    
    public class UpdateCartHandle: IRequestHandler<UpdateCartCommand, ApiResult<string>>
    {
        private readonly ICartService _service;

        public UpdateCartHandle(ICartService service)
        {
            _service = service;
        }

        public async Task<ApiResult<string>> Handle(UpdateCartCommand request, CancellationToken cancellationToken)
        {
            return await _service.UpdateAsync(request);
        }
    }
}