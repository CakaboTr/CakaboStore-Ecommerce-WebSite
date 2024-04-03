using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CakaboStore.DAL.Entities
{
	public class Category
	{
		[Display(Name = "Üst Kategori Adı")]
		public int? ParentID { get; set; }
		public Category ParentCategory { get; set; }
		public ICollection<Category> SubCategories { get; set; }


		public int ID { get; set; }
		[Column(TypeName = "varchar(50)"), StringLength(50), Display(Name = "Kategori Adı")]
		public string Name { get; set; }
		public int DisplayIndex { get; set; }


		public ICollection<Product> Products { get; set; }

	}
}
