using System.ComponentModel.DataAnnotations;
using System.Threading;
using System.Threading.Tasks;
using ElectronicShop.Application.Common.Models;
using MediatR;

namespace ElectronicShop.Application.Carts.Commands.CreateCart
{
    public class CreateCartCommand : IRequest<ApiResult<string>>
    {
        [Required]
        public int ProductId { get; set; }
        [Required]
        public int Quantity { get; set; }
    }
    
    public class CreateCartHandle: IRequestHandler<CreateCartCommand, ApiResult<string>>
    {
        public Task<ApiResult<string>> Handle(CreateCartCommand request, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}