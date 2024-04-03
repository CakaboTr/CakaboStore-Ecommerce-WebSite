using CakaboStore.BL.Repositories;
using CakaboStore.DAL.Entities;
using CakaboStore.UI.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace CakaboStore.UI.Controllers
{
    public class CategoryController : Controller
    {
        private readonly IRepository<Product> _productRepository;

        public CategoryController(IRepository<Product> productRepository)
        {
            _productRepository = productRepository;
        }

        public IActionResult Products(int categoryId)
        {
            var productsInCategory = _productRepository
                .GetAll(p => p.CategoryID == categoryId)
                .Include(p => p.Category)
                .Include(p => p.ProductPictures)
                .ToList();

            var categoryProductsViewModel = new CategoryVM
            {
                Category = productsInCategory.FirstOrDefault()?.Category,
                Product = productsInCategory
            };

            return View(categoryProductsViewModel);
        }
    }
}
