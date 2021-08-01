using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ElectronicShop.Data.Configurations
{
    public class ProductInventoryConfiguration : IEntityTypeConfiguration<ProductInventory>
    {
        public void Configure(EntityTypeBuilder<ProductInventory> builder)
        {
            builder.ToTable("ProductInventory");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.CostPrice)
                .HasColumnType("decimal");

            builder.Property(x => x.CreatedDate)
                .HasColumnType("datetime");

            builder.HasOne(x => x.Product)
                .WithMany(x => x.ProductInventories)
                .HasForeignKey(x => x.ProductId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.User)
                .WithMany(x => x.ProductInventories)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
