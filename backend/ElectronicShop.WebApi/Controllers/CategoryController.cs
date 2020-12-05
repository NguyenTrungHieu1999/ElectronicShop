using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.WebApi.ActionFilters;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly IMediator _mediator;

        public CategoryController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [Authorize(Roles = "Emp")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromBody] CreateCategoryCommand request)
        {
            var result = await _mediator.Send(request);

            return result.IsSuccessed ? (IActionResult) Ok(result) : BadRequest(result);
        }
    }
}