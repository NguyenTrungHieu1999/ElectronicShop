using System;
using System.Collections.Generic;
using System.Text;

namespace ElectronicShop.Data.Entities
{
    public class LoginHistory
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public DateTime AccessTime { get; set; }

        public User User { get; set; }
    }
}
