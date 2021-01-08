using ElectronicShop.Application.Common.Repositories;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.OrderDetails.Repositories
{
    public class OrderDetailRepository : RepositoryBase<OrderDetail>, IOrderDetailRepository
    {
        public OrderDetailRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}