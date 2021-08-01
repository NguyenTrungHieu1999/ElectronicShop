using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class add_deleted_field_for_cmt_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Deleted",
                table: "Comment",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "02a5a1ba-890d-4efc-aa83-6b95acaca752");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "6d7e4971-f5c1-4781-8270-24b848f3d6cd");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "dc38c50b-3b18-4785-a956-e90a712906ff");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "f8226829-054f-4a21-a30c-40358f734ac1", "AQAAAAEAACcQAAAAEAssMRdj7ZcdyqrmBWqlC5FaKgrk+sJu+0sq/QfXdr2iwGyDelbpADKFAlalOh5RWg==", "f7a892cf-7d88-48e2-9c26-8205d041dea9" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "6b4c3277-5240-41a9-8e38-034f3c25027e", "AQAAAAEAACcQAAAAEJ7KsKU+7WWOPJIcGShXZdE+ilaj1lbsMtrZaKifTGmQIozDAKkbTc9VMHXq6BQz0w==", "f31ca290-be80-4657-b13e-a4edc6d1b01e" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "8bd582e6-5b1c-4e47-8575-2c11a4ea17eb", "AQAAAAEAACcQAAAAEC7nccoQzW28wkdSUQ4S3NZOEagjP9pzT9iOrB+9Z/h14a3F9Uah6ascYJSBM4eZ6A==", "9bc66d37-e822-4f1d-98b7-50282485a9b4" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Deleted",
                table: "Comment");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "2cb48413-4b03-491f-a24d-6dc499034218");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "5301a35b-544f-4583-9f1e-c23cc99e56b3");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "4440538e-0c39-4da1-90bf-fcf1e929a7fd");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "1170e0d1-6a4e-49fd-bda2-8f6ddfeadb78", "AQAAAAEAACcQAAAAEBcL1xICLUhbKUFYrVrQmKsZIaHb9rNr+kVF7AYTaNzRg3pDq8Sr/5yIZbVD6PfpUA==", "fff76992-e8d3-45a9-a9bc-2b905f22ec25" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "d3dfe2fb-c753-4fc9-9988-f8653b9b5f66", "AQAAAAEAACcQAAAAECs/w9NieQUvJ059QVBcl2ZIcdczWgvC+PlmCvUt7HwMjCGnCq5iPReXsKzaLAoasg==", "68f40dd8-cf5e-4649-bc36-8a7f80ac067d" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "7399040d-5ec1-4512-aa96-af57f69c0279", "AQAAAAEAACcQAAAAEB3+wOfGD726vIB/O/SDzA1o4HlFtCvhoFTBhFhytLWWYUI4YTeYWHb5uM1EV9liNA==", "7c07f92e-97b0-44a3-84e9-00d5c5ef78f5" });
        }
    }
}
