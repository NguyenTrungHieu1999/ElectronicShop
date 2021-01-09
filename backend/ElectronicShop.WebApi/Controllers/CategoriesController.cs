using ElectronicShop.Application.Categories.Commands.CreateCategory;
using ElectronicShop.Application.Categories.Commands.UpdateCategory;
using ElectronicShop.Application.Categories.Queries.GetAllCategory;
using ElectronicShop.Application.Categories.Queries.GetCategoryById;
using ElectronicShop.Utilities.SystemConstants;
using ElectronicShop.WebApi.ActionFilters;
using ElectronicShop.WebApi.AuthorizeRoles;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using ElectronicShop.Application.Categories.Queries.GetAllProductType;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AuthorizeRoles(Constants.ADMIN, Constants.EMP)]
    public class CategoriesController : BaseController
    {
        private readonly IMediator _mediator;

        public CategoriesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("create")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Create([FromBody] CreateCategoryCommand request)
        {
            return Ok(await _mediator.Send(request));
        }

        [HttpPut("update")]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<IActionResult> Update([FromBody] UpdateCategoryCommand request)
        {
            return Ok(await _mediator.Send(request));
        }

        [HttpGet("{cateId}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(int cateId)
        {
            var query = new GetCategoryByIdQuery(cateId);

            return Ok(await _mediator.Send(query));
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll()
        {
            var query = new GetAllCategoryQuery();

            return Ok(await _mediator.Send(query));
        }

        [HttpGet("productType")]
        [AllowAnonymous]
        public async Task<IActionResult> GetAllProductType()
        {
            return Ok(await _mediator.Send(new GetAllProductTypeQuery()));
        }
    }
}