using AutoMapper;
using ElectronicShop.Application.Common.Models;
using ElectronicShop.Application.Orders.Commands.CreateOrder;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ElectronicShop.Application.OrderDetails.Extensions;
using ElectronicShop.Application.Orders.Commands.EmpCreateOrder;
using ElectronicShop.Application.Orders.Models;
using ElectronicShop.Infrastructure.FileImage;

namespace ElectronicShop.Application.Orders.Services
{
    public class OrderService : IOrderService
    {
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ElectronicShopDbContext _context;
        private const int MaxOrderStatusId = 7;
        private readonly IStorageService _storageService;
        private readonly int _userId;
        public OrderService(IMapper mapper, IHttpContextAccessor httpContextAccessor, ElectronicShopDbContext context, IStorageService storageService)
        {
            _mapper = mapper;
            _httpContextAccessor = httpContextAccessor;
            _context = context;
            _storageService = storageService;
            if (_httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
            {
                _userId = int.Parse(_httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            }
        }

        public async Task<ApiResult<Order>> CreateAsync(CreateOrderCommand command)
        {
            await using var transaction = await _context.Database.BeginTransactionAsync();
            // Tạo đơn hàng
            var order = _mapper.Map<Order>(command);
            order.TotalMoney = 0;
            order.Received = false;
            order.CreatedDate = DateTime.Now;
            order.DeliveryDate = DateTime.Now.AddDays(7);
            order.StatusId = 1;
            var isAuth = _httpContextAccessor.HttpContext.User.Identity.IsAuthenticated;

            if (isAuth)
            {
                order.UserId = _userId;
            }

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };

            // Tạo thông tin cho chi tiết đơn hàng
            order.OrderDetails = new List<OrderDetail>();

            foreach (var detail in command.OrderDetails)
            {
                order.TotalMoney += detail.Price * detail.Quantity;

                var orderDetail = new OrderDetail();

                orderDetail.Map(detail);
                order.OrderDetails.Add(orderDetail);

                // Cập nhật số lượng sản phẩm tồn sau khi đặt hàng thành công
                var product = await _context.Products.FindAsync(detail.ProductId);
                product.Inventory -= detail.Quantity;

                if (product.Inventory < 0)
                {
                    return await Task.FromResult(new ApiErrorResult<Order>("Số lượng hàng ở kho của sản phẩm " + product.Name + " không còn đủ."));
                }

                _context.Products.Update(product);
            }

            await _context.Orders.AddAsync(order);

            // Lưu thông tin
            try
            {
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                return await Task.FromResult(new ApiErrorResult<Order>("Thêm đơn hàng thất bại"));
            }

            return await Task.FromResult(new ApiSuccessResult<Order>(order));
        }

        public async Task<ApiResult<Order>> EmpCreateAsync(EmpCreateOrderCommand command)
        {
            await using var transaction = await _context.Database.BeginTransactionAsync();
            var order = _mapper.Map<Order>(command);
            order.CreatedDate = DateTime.Now;
            order.Paid = true;
            order.PaymentMethod = "Tại cửa hàng";
            order.StatusId = MaxOrderStatusId; // Mặc định đã giao hàng
            order.Received = true; // Mặc định đã nhận hàng

            if (command.ReceiversAddress is null)
            {
                order.ReceiversAddress = "Số 1, Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức, TP HCM";
            }

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now,
                    EmpId = _userId
                }
            };
            // Tạo thông tin cho chi tiết đơn hàng
            order.OrderDetails = new List<OrderDetail>();
            foreach (var detail in command.OrderDetails)
            {
                var orderDetail = new OrderDetail();

                orderDetail.Map(detail);
                order.OrderDetails.Add(orderDetail);

                // Cập nhật số lượng sản phẩm tồn sau khi đặt hàng thành công
                var product = await _context.Products.FindAsync(detail.ProductId);
                product.Inventory -= detail.Quantity;

                if (product.Inventory < 0)
                {
                    return await Task.FromResult(new ApiErrorResult<Order>("Số lượng hàng ở kho của sản phẩm " + product.Name + " không còn đủ."));
                }

                _context.Products.Update(product);
            }

            await _context.Orders.AddAsync(order);
            // Lưu thông tin
            try
            {
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                return await Task.FromResult(new ApiErrorResult<Order>("Thêm đơn hàng thất bại"));
            }

            return await Task.FromResult(new ApiSuccessResult<Order>(order));
        }

        public async Task<ApiResult<Order>> ChangeStatusAsync(int orderId)
        {
            var order = await _context.Orders.Where(x => x.Id.Equals(orderId)).Include(x => x.OrderStatus).SingleOrDefaultAsync();

            if (order.StatusId < MaxOrderStatusId)
            {
                order.StatusId += 1;
            }

            // Nếu trạng thái bằng giao hàng thành công thì cập nhật đã thanh toán (nếu chưa)
            if (order.StatusId == MaxOrderStatusId)
            {
                order.Paid = true;
            }

            var orderStatus = await _context.OrderStatuses.FindAsync(order.StatusId);

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now,
                    EmpId = _userId
                }
            };

            _context.Orders.Update(order);

            await _context.SaveChangesAsync();

            return await Task.FromResult(
                new ApiSuccessResult<Order>
                {
                    Message = "Bạn đã cập nhật trạng thái thành " + orderStatus.Name,
                    ResultObj = order
                });
        }

        public async Task<ApiResult<List<Order>>> GetAllAsync()
        {
            var orders = await _context.Orders
                .Include(x => x.OrderDetails)
                .Include(x => x.OrderStatusDetails)
                .ToListAsync();

            return await Task.FromResult(new ApiSuccessResult<List<Order>>(orders));
        }

        public async Task<ApiResult<List<OrderVm>>> GetOrderByUserIdAsync()
        {
            var results = new List<OrderVm>();

            var orders = await _context.Orders
                .Where(o => o.UserId == _userId)
                .Include(od => od.OrderDetails)
                .Include(ods => ods.OrderStatusDetails)
                .OrderByDescending(o=>o.CreatedDate)
                .ToListAsync();

            foreach (var o in orders.Where(o => o is { }))
            {
                var orderStatus = await _context.OrderStatuses.Where(osd => osd.Id.Equals(o.StatusId)).SingleOrDefaultAsync();
                var ordersVm = new OrderVm
                {
                    OrderId = o.Id,
                    OrderStatus = orderStatus.Name,
                    StatusId = o.StatusId,
                    TotalPrice = o.TotalMoney,
                    Receiver = o.Receiver,
                    ReceiversAddress = o.ReceiversAddress,
                    PhoneNumber = o.PhoneNumber,
                    DeliveryDate = o.DeliveryDate,
                    Received = o.Received,
                    PaymentMethod = o.PaymentMethod,
                    OrderStatusDetails = o.OrderStatusDetails
                };

                ordersVm.Products = new List<ListProduct>();

                foreach (var od in o.OrderDetails)
                {
                    var product = await _context.Products.Where(x => x.Id.Equals(od.ProductId))
                        .Include(x => x.ProductPhotos)
                        .SingleOrDefaultAsync();
                    if (product != null)
                    {
                        ordersVm.Products.Add(new ListProduct
                        {
                            ProductId = product.Id,
                            CateId = product.CategoryId,
                            Inventory = product.Inventory,
                            Alias = product.Alias,
                            Price = product.Price,
                            ProductName = product.Name,
                            Quantity = od.Quantity,
                            ProductPhoto = "https://localhost:5001/" + _storageService.CreateProductPath(product.CategoryId, product.Name) + "/" + product.ProductPhotos[0].Url,
                        });
                    }
                }
                results.Add(ordersVm);
            }

            return await Task.FromResult(new ApiSuccessResult<List<OrderVm>>(results));
        }

        public async Task<ApiResult<Order>> GetOrderByIdAsync(int orderId)
        {
            var order = await FindOrderByIdAsync(orderId);

            return await Task.FromResult(new ApiSuccessResult<Order>(order));
        }

        public async Task<ApiResult<Order>> MyOrderByIdAsync(int orderId)
        {
            var order = await FindOrderByIdAsync(orderId);

            if (order != null && order.UserId.Equals(_userId))
            {
                return await Task.FromResult(new ApiSuccessResult<Order>(order));
            }

            return await Task.FromResult(new ApiErrorResult<Order>("Không tìm thấy đơn hàng."));
        }

        public async Task<ApiResult<Order>> CancelOrderAsync(int orderId)
        {
            var order = await _context.Orders.Where(x => x.Id == orderId && x.StatusId != 8).SingleOrDefaultAsync();

            if (order is null)
                return await Task.FromResult(new ApiErrorResult<Order>("Không tìm thấy đơn hàng."));

            order.StatusId = 8;

            var orderDetails = await _context.OrderDetails.Where(x => x.OrderId.Equals(orderId)).ToListAsync();

            foreach (var item in orderDetails)
            {
                var product = await _context.Products.FindAsync(item.ProductId);
                product.Inventory += item.Quantity;
                _context.Update(product);
            }

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now,
                    EmpId = _userId
                }
            };

            _context.Update(order);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<Order>(order));
        }

        public async Task<ApiResult<string>> CancelMyOrderAsync(int orderId)
        {
            var order = await _context.Orders.Where(x => x.Id == orderId && x.UserId.Equals(_userId) && x.StatusId < 3).SingleOrDefaultAsync();

            if (order is null)
                return await Task.FromResult(new ApiErrorResult<string>("Không tìm thấy đơn hàng."));
            order.StatusId = 8;

            var orderDetails = await _context.OrderDetails.Where(x => x.OrderId.Equals(orderId)).ToListAsync();

            foreach (var item in orderDetails)
            {
                var product = await _context.Products.FindAsync(item.ProductId);
                product.Inventory += item.Quantity;
                _context.Update(product);
            }

            // Tạo thông tin trạng thái của đơn hàng
            order.OrderStatusDetails = new List<OrderStatusDetail>()
            {
                new OrderStatusDetail()
                {
                    StatusId = order.StatusId,
                    CreatedDate = DateTime.Now
                }
            };

            _context.Update(order);

            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<string>("Đơn hàng đã được hủy."));
        }

        private async Task<Order> FindOrderByIdAsync(int orderId)
        {
            var order = await _context.Orders
                .Where(x => x.Id == orderId)
                .Include(x => x.OrderDetails)
                .Include(x => x.OrderStatusDetails)
                .SingleOrDefaultAsync();

            return order;
        }

        public async Task<ApiResult<List<SellingProductsVM>>> SellingProducts(int m, int y)
        {
            var sellingProducts = _context.Orders
                .Where(o => o.CreatedDate.Month.Equals(m) && o.CreatedDate.Year.Equals(y) && o.StatusId.Equals(MaxOrderStatusId))
                .Join(_context.OrderDetails, o => o.Id, od => od.OrderId, (o, od) => new { o, od })
                .Join(_context.Products, @t => @t.od.ProductId, p => p.Id, (@t, p) => new { @t, p })
                .GroupBy(@t => new
                {
                    @t.p.Id,
                    @t.p.Name,
                    @t.p.Price,
                    @t.p.Status,
                }, @t => @t.@t.od)
                .OrderByDescending(s => s.Sum(x => x.Quantity))
                .Select(result => new
                {
                    id = result.Key.Id,
                    name = result.Key.Name,
                    price = result.Key.Price,
                    quantity = result.Sum(x => x.Quantity),
                    status = result.Key.Status
                });

            var results = new List<SellingProductsVM>();
            foreach (var i in sellingProducts)
            {
                results.Add(new SellingProductsVM
                {
                    Id = i.id,
                    Name = i.name,
                    Price = i.price,
                    Quantity = i.quantity,
                    Status = i.status
                });
            }

            return await Task.FromResult(new ApiSuccessResult<List<SellingProductsVM>>(results));
        }

        public async Task<ApiResult<bool>> HasReceivedAsync(int orderId)
        {
            var order = await _context.Orders
                .Where(o => o.Id.Equals(orderId) && o.UserId.Equals(_userId) && o.StatusId == MaxOrderStatusId)
                .SingleOrDefaultAsync();

            if (order is null)
            {
                return await Task.FromResult(new ApiErrorResult<bool>("Không tìm thấy đơn hàng"));
            }

            order.Received = true;
            _context.Update(order);
            await _context.SaveChangesAsync();

            return await Task.FromResult(new ApiSuccessResult<bool>(true));
        }
    }
}