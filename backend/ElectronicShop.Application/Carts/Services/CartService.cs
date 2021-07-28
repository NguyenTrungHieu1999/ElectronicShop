using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using ElectronicShop.Application.Common.Models;
using System.Threading.Tasks;
using ElectronicShop.Application.Carts.Commands.UpdateCart;
using ElectronicShop.Application.Carts.Models;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ElectronicShop.Application.Carts.Commands.AddCart;
using ElectronicShop.Data.Enums;

namespace ElectronicShop.Application.Carts.Services
{
    public class CartService : ICartService
    {

        private readonly ElectronicShopDbContext _context;
        private readonly int _userId;

        public CartService(ElectronicShopDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;

            if (httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
            {
                _userId = int.Parse(httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            }
        }

        public async Task<ApiResult<string>> CreateAsync(List<CartModel> models)
        {
            await using var transaction = await _context.Database.BeginTransactionAsync();

            foreach (var cart in models.Select(cartModel => new Cart
            {
                ProductId = cartModel.ProductId,
                UserId = _userId,
                Quantity = cartModel.Quantity,
                Status = true
            }))
            {
                await _context.Carts.AddAsync(cart);
            }

            var oldShoppingCarts = await _context.Carts
                .Where(x => x.UserId == _userId && x.Status)
                .ToListAsync();

            foreach (var item in oldShoppingCarts)
            {
                item.Status = false;
                _context.Carts.Update(item);
            }

            try
            {
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                return await Task.FromResult(new ApiErrorResult<string>("Thêm sản phẩm vào giỏ hàng thất bại!"));
            }
            return await Task.FromResult(new ApiSuccessResult<string>("Thêm sản phẩm vào giỏ hàng thành công!"));
        }

        public async Task<ApiResult<List<CartVm>>> GetAllAsync()
        {
            var carts = await _context.Carts
                .Include(x => x.Product)
                .Where(x => (x.Product.Status != ProductStatus.HIDDEN && x.Product.Status != ProductStatus.DELETED) && x.UserId.Equals(_userId) && x.Status)
                .ToListAsync();

            var cartModels = carts.Select(cart => new CartVm
            {
                Product = cart.Product,
                Quantity = cart.Quantity
            }).ToList();

            return await Task.FromResult(new ApiSuccessResult<List<CartVm>>(cartModels));
        }

        public async Task<ApiResult<string>> AddAsync(AddCartCommand command)
        {
            var cart = new Cart
            {
                ProductId = command.ProductId,
                UserId = _userId,
                Quantity = command.Quantity,
                Status = true
            };
            try
            {
                await _context.AddAsync(cart);
                await _context.SaveChangesAsync();
            }
            catch
            {
                return await Task.FromResult(new ApiErrorResult<string>("Thêm vào giỏ hàng thất bại!"));
            }

            return await Task.FromResult(new ApiSuccessResult<string>("Thêm vào giỏ hàng thành công!"));
        }

        public async Task<ApiResult<string>> UpdateAsync(UpdateCartCommand command)
        {
            var cart = await _context.Carts
                .Where(x => x.Status && x.ProductId.Equals(command.ProductId) && x.UserId.Equals(_userId))
                .SingleOrDefaultAsync();

            if (cart is null)
            {
                return await Task.FromResult(new ApiErrorResult<string>("Cập nhật giỏ hàng thất bại"));
            }

            cart.Quantity += command.Total;

            if (cart.Quantity == 0)
            {
                cart.Status = false;
            }

            _context.Carts.Update(cart);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Cập nhật giỏ hàng thành công"));
        }

        public async Task<ApiResult<string>> RemoveAllCart()
        {
            var carts = await _context.Carts
                .Where(x => x.UserId.Equals(_userId) && x.Status)
                .ToListAsync();

            foreach (var cart in carts)
            {
                cart.Quantity = 0;
                cart.Status = false;
                _context.Update(cart);
            }

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Xóa giỏ hàng thành công!"));
        }
    }
}