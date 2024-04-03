using CakaboStore.DAL.Entities;
using CakaboStore.UI.Models;

namespace CakaboStore.UI.ViewModels
{
	public class CheckOutVM
	{
		public Order Order { get; set; }

		public IEnumerable<Cart> Carts { get; set; }
	}
}
