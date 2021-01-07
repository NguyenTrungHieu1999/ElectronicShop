using ElectronicShop.Application.Common.Repositories;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Orders.Repositories
{
    public class OrderRepository : RepositoryBase<Order>, IOrderRepository
    {
        public OrderRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}
