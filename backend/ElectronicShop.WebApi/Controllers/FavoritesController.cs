using System.Threading.Tasks;
using ElectronicShop.Application.Favorites.Commands.CleanFavorite;
using ElectronicShop.Application.Favorites.Commands.CreateFavorite;
using ElectronicShop.Application.Favorites.Queries.GetAllFavorite;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectronicShop.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavoritesController : BaseController
    {
        private readonly IMediator _mediator;

        public FavoritesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpPost("add-remove")]
        [Authorize]
        public async Task<IActionResult> Create([FromBody]AddRemoveFavoriteCommand command)
        {
            return Ok(await _mediator.Send(command));
        }

        [HttpGet("getAll")]
        [Authorize]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _mediator.Send(new GetAllFavoriteByUserIdQuery()));
        }

        [HttpPut("clean")]
        [Authorize]
        public async Task<IActionResult> Clean()
        {
            return Ok(await _mediator.Send(new CleanFavoriteCommand()));
        }
    }
}