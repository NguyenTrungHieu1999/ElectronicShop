using ElectronicShop.Application.Common.Repositories;
using ElectronicShop.Data.EF;
using ElectronicShop.Data.Entities;

namespace ElectronicShop.Application.Products.Repositories
{
    public class ProductRepository : RepositoryBase<Product>, IProductRepository
    {
        public ProductRepository(ElectronicShopDbContext context) : base(context)
        {
        }
    }
}