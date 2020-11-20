using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ElectronicShop.Data.Configurations
{
    class WatchedProductConfiguration : IEntityTypeConfiguration<WatchedProduct>
    {
        public void Configure(EntityTypeBuilder<WatchedProduct> builder)
        {
            builder.ToTable("WatchedProduct");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.UserId)
                .IsRequired();

            builder.Property(x => x.ProductId)
                .IsRequired();

            builder.HasOne(x => x.User)
                .WithMany(x => x.WatchedProducts)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.Product)
                .WithMany(x => x.WatchedProducts)
                .HasForeignKey(x => x.ProductId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
