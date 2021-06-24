using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ElectronicShop.Data.Configurations
{
    public class CategoryConfiguration:IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.ToTable("Category");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.Name)
                .IsRequired()
                .HasMaxLength(50);

            builder.Property(x => x.Alias)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(x => x.CreatedDate)
                .IsRequired()
                .HasColumnType("DateTime");

            builder.Property(x => x.ModifiedDate)
                .HasColumnType("DateTime")
                .IsRequired(false);

            builder.Property(x => x.CreatedBy)
                .HasMaxLength(30)
                .IsRequired();

            builder.Property(x => x.ModifiedBy)
                .HasMaxLength(30)
                .IsRequired(false);

            builder.HasOne(x => x.Parent)
                .WithMany(x=>x.Children)
                .HasForeignKey(x => x.RootId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(x => x.ProductType)
                 .WithMany(x => x.Categories)
                 .HasForeignKey(x => x.ProductTypeId)
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
