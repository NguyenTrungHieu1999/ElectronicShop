using Microsoft.EntityFrameworkCore.Migrations;

namespace ElectronicShop.Data.Migrations
{
    public partial class addreceivedcolumntoordertable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Received",
                table: "Order",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "OrderStatus",
                keyColumn: "Id",
                keyValue: 2,
                column: "Name",
                value: "Được tiếp nhận");

            migrationBuilder.UpdateData(
                table: "OrderStatus",
                keyColumn: "Id",
                keyValue: 8,
                column: "Name",
                value: "Đã hủy");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "1b6c9ca9-2669-41d3-8dcf-e698d2345d47");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "325ce652-b26b-4ed1-b0f9-8884c9c3b2b9");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "981c28a4-afb2-486f-9d12-f31267ef02b6");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "5647c026-a5a5-49bb-801a-db97f517fc58", "AQAAAAEAACcQAAAAEDxgmb7+VZzZAW5S7rjlSBl16wu1Ifg/fxxBsgu9rX3qODyQo3jP5UNAuKqEk5BrCw==", "8ac04f65-eca2-4b82-826b-ef2d70a6d26b" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "Email", "NormalizedEmail", "PasswordHash", "SecurityStamp" },
                values: new object[] { "ac9ddec2-0323-4c3e-9166-8cba4b50fbcc", "17110299@student.hcmute.edu.vn", "17110299@STUDENT.HCMUTE.EDU.VN", "AQAAAAEAACcQAAAAEFTMmCL4G1UZVAanT2JDtyOyNYvKlAEu95948Kbfap2QA1Lr19hJk43bbVF4YsFCwg==", "58017128-5db8-4332-9ec2-d9e1e48d4931" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "e7266a47-213d-40d7-9364-1409179157f8", "AQAAAAEAACcQAAAAEPXYnuGJQSfssiiYJ8aMXpPAgSI3ENvTZeB4qCAsbXwT4Wie7tTIhy/a2YdJR81t4w==", "e4bc693a-ab50-4e92-af76-55f509ac144f" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Received",
                table: "Order");

            migrationBuilder.UpdateData(
                table: "OrderStatus",
                keyColumn: "Id",
                keyValue: 2,
                column: "Name",
                value: "Đã tiếp nhận");

            migrationBuilder.UpdateData(
                table: "OrderStatus",
                keyColumn: "Id",
                keyValue: 8,
                column: "Name",
                value: "Hủy đơn hàng");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 1,
                column: "ConcurrencyStamp",
                value: "d93db9c3-3984-44e9-8ccd-aa83a4920445");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 2,
                column: "ConcurrencyStamp",
                value: "2f5ed3f2-370e-45d6-9cec-eae24ebd3d84");

            migrationBuilder.UpdateData(
                table: "Role",
                keyColumn: "Id",
                keyValue: 3,
                column: "ConcurrencyStamp",
                value: "b8a5167d-f7fd-428e-9c14-07e235d94ea5");

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "6b8d905c-28e9-451e-89c3-18603e2bfb1a", "AQAAAAEAACcQAAAAEB5poc7DjzBhESi4aMWHVfbwcelwTSAc1IsL1JteY0+h9/GRY+0dyIKpRANg5sDyLg==", "a34917ca-a186-41f8-85f0-415b938fe2a8" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 2,
                columns: new[] { "ConcurrencyStamp", "Email", "NormalizedEmail", "PasswordHash", "SecurityStamp" },
                values: new object[] { "c455d2cf-6bb7-4805-9541-2acd58871a1c", "hieu@gmail.com", "HIEU@GMAIL.COM", "AQAAAAEAACcQAAAAEHLZ+EKsYfzAZ1p8rIo/D9SBBwBzvmRxzzI7AV5TmkCKYgk+0HPJXRBGMeek8DYv1A==", "789c9373-4516-41e7-ae7d-eb100c41e2e2" });

            migrationBuilder.UpdateData(
                table: "User",
                keyColumn: "Id",
                keyValue: 3,
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "7c62c16e-b797-4346-8e74-49b0b9a2d319", "AQAAAAEAACcQAAAAEMwgiOtJ5YYPZjJuE2AkSTIY0kqJlwSooIMSvmGJscDBx0bMaiWNNPutCWZ1nlvAeA==", "31096827-ea4e-45dd-a224-5369a867f4b3" });
        }
    }
}
