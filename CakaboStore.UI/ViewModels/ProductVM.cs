using CakaboStore.DAL.Entities;

namespace CakaboStore.UI.ViewModels
{
	public class ProductVM
	{
		public Product Product { get; set; }
		public IEnumerable<Product> RelatedProducts { get; set; }
	}
}
