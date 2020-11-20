using ElectronicShop.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace ElectronicShop.Data.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("User");

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Id)
                .UseIdentityColumn();

            builder.Property(x => x.FirstMiddleName)
                .HasMaxLength(50)
                .IsRequired();

            builder.Property(x => x.Name)
                .HasMaxLength(20)
                .IsRequired();

            builder.Property(x => x.Address)
                .HasMaxLength(100)
                .IsRequired();

            builder.Property(x => x.Status)
                .IsRequired();

            builder.Property(x => x.Sex)
                .IsRequired();

            builder.Property(x => x.CreatedDate)
                .HasColumnType("DateTime");

            builder.Property(x => x.ModifiedDate)
                .HasColumnType("DateTime");

            builder.Property(x => x.CreatedBy)
                .HasMaxLength(20);

            builder.Property(x => x.ModifiedBy)
                .HasMaxLength(20);

            builder.Property(x => x.UserName)
                .HasMaxLength(20)
                .IsRequired();
        }
    }
}
