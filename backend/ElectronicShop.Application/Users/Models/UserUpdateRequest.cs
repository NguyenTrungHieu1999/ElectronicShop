using ElectronicShop.Data.Enums;
using System;
using System.ComponentModel.DataAnnotations;

namespace ElectronicShop.Application.Users.Models
{
    public class UserUpdateRequest
    {
        public int Id { get; set; }

        [Required, StringLength(50, MinimumLength = 1)]
        public string FirstMiddleName { get; set; }

        [Required, StringLength(30, MinimumLength = 1)]
        public string LastName { get; set; }

        [Required, DataType(DataType.Date)]
        public DateTime Birthday { get; set; }

        [Required]
        public Gender Gender { get; set; }

        [Required, DataType(DataType.PhoneNumber), StringLength(11)]
        [Phone]
        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        [Required]
        public UserStatus Status { get; set; }
    }
}
