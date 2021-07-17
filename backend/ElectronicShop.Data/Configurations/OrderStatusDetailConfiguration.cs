using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ElectronicShop.Data.Configurations
{
    public class OrderStatusDetailConfiguration : IEntityTypeConfiguration<OrderStatusDetail>
    {
        public void Configure(EntityTypeBuilder<OrderStatusDetail> builder)
        {
            builder.ToTable("OrderStatusDetail");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.CreatedDate)
                .HasColumnType("DateTime")
                .IsRequired();

            builder.Property(x => x.StatusId)
                .IsRequired();

            builder.Property(x => x.OrderId)
                .IsRequired();

            builder.Property(x => x.EmpId)
                .IsRequired(false);

            builder.HasOne(x => x.Order)
                .WithMany(x => x.OrderStatusDetails)
                .HasForeignKey(x => x.OrderId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.OrderStatus)
                .WithMany(x => x.OrderStatusDetails)
                .HasForeignKey(x => x.StatusId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.User)
                .WithMany(x => x.OrderStatusDetails)
                .HasForeignKey(x => x.EmpId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
