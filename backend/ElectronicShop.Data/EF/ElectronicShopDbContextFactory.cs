using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using System.IO;

namespace ElectronicShop.Data.EF
{
    class ElectronicShopDbContextFactory : IDesignTimeDbContextFactory<ElectronicShopDbContext>
    {
        public ElectronicShopDbContext CreateDbContext(string[] args)
        {

            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("DefaultDb");

            var optionsBuilder = new DbContextOptionsBuilder<ElectronicShopDbContext>();
            optionsBuilder.UseSqlServer(connectionString);

            return new ElectronicShopDbContext(optionsBuilder.Options);
        }
    }
}
