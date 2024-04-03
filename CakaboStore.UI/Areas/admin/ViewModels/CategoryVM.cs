using CakaboStore.DAL.Entities;

namespace CakaboStore.UI.Areas.admin.ViewModels
{
    public class CategoryVM
    {
        public Category Category { get; set; } // ekle sil güncelle işlemleri için
        public IEnumerable<Category> Categories { get; set; } // Combobox için
    }
}
