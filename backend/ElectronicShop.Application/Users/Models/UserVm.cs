using ElectronicShop.Data.Enums;

namespace ElectronicShop.Application.Users.Models
{
    public class UserVm
    {
        public int Id { get; set; }

        public string UserName { get; set; }

        public string Email { get; set; }

        public string Birthday { get; set; }

        public string FirstMiddleName { get; set; }

        public string LastName { get; set; }

        public string PhoneNumber { get; set; }

        public Gender Gender { get; set; }
    }
}
