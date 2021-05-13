using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Commands.AddCart;
using ElectronicShop.Application.Carts.Commands.CreateCart;
using ElectronicShop.Application.Carts.Commands.RemoveCart;
using ElectronicShop.Application.Carts.Commands.UpdateCart;
using ElectronicShop.Application.Carts.Queries;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartsController : BaseController
    {
        private readonly IMediator _mediator;

        public CartsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromBody]CreateCartCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpGet("getAll")]
        [Authorize]
        public async Task<IActionResult> GetAll()
        {
            var query = new GetAllCartByUserIdQuery();
            return Ok(await _mediator.Send(query));
        }

        [HttpPost("add")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Add([FromBody]AddCartCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPut("update")]
        [Authorize]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody]UpdateCartCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpPut("remove")]
        [Authorize]
        public async Task<IActionResult> Remove()
        {
            return Ok(await _mediator.Send(new RemoveCartCommand()));
        }
    }
}