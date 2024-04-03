using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakaboStore.DAL.Entities
{
	public enum EOrderStatus
	{
		[Display(Name = "Siparişiniz Hazırlanıyor")]
		Hazirlaniyor,

		KargoyaVerildi,
		TeslimEdildi,
		IptalEdildi
	}
}
