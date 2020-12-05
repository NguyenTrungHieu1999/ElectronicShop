﻿using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ElectronicShop.Data.Configurations
{
    public class OrderConfiguration : IEntityTypeConfiguration<Order>
    {
        public void Configure(EntityTypeBuilder<Order> builder)
        {
            builder.ToTable("Order");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.CreatedDate)
                .HasColumnType("DateTime");

            builder.Property(x => x.ModifiedDate)
                .HasColumnType("DateTime");

            builder.Property(x => x.DeliveryDate)
                .HasColumnType("DateTime")
                .IsRequired();

            builder.Property(x => x.Paid)
                .IsRequired();

            builder.Property(x => x.Receiver)
                .HasMaxLength(30)
                .IsRequired();

            builder.Property(x => x.ReceiversAddress)
                .HasMaxLength(200)
                .IsRequired();

            builder.Property(x => x.PhoneNumber)
                .HasMaxLength(11)
                .IsRequired();

            builder.Property(x => x.TotalMoney)
                .HasColumnType("decimal(18,0)")
                .IsRequired();

            builder.HasOne(x => x.OrderStatus)
                .WithMany(x => x.Orders)
                .HasForeignKey(x => x.StatusId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
