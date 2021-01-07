using System;

namespace ElectronicShop.Application.Orders.Models
{
    public class OrderVm
    {
        public int Id { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public DateTime DeliveryDate { get; set; }//Ngày giao dự kiến

        public bool Paid { get; set; }//Đã thanh toán

        public string Receiver { get; set; }

        public string ReceiversAddress { get; set; }

        public string PhoneNumber { get; set; }

        public decimal TotalMoney { get; set; }

        public int StatusId { get; set; }

        public int UserId { get; set; }
    }
}
