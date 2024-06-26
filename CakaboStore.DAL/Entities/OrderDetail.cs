﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakaboStore.DAL.Entities
{
	public class OrderDetail
	{
		public int ID { get; set; }

		[Display(Name = "Sipariş Numarası")]
		public int OrderID { get; set; }

		public Order Order { get; set; }

		[Display(Name = "Ürün ID")]
		public int ProductID { get; set; }

		[Column(TypeName = "Varchar(100)"), StringLength(100), Display(Name = "Ürün Adı")]
		public string ProductName { get; set; }

		[Column(TypeName = "Varchar(150)"), StringLength(150), Display(Name = "Ürün Fotoğrafı")]
		public string ProductPicture { get; set; }

		[Column(TypeName = "decimal(18,2)"), Display(Name = "Ürün Fiyat Bilgisi")]
		public decimal ProductPrice { get; set; }


		[Display(Name = "Ürün Miktarı")]
		public int Quantity { get; set; }

	}
}
