using CakaboStore.BL.Repositories;
using CakaboStore.DAL.Entities;
using CakaboStore.UI.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace CakaboStore.UI.Controllers
{
	public class HomeController : Controller
	{
		IRepository<Slide> repoSlide;
		IRepository<Product> repoProduct;
		public HomeController(IRepository<Slide> _repoSlide, IRepository<Product> _repoProduct)
		{
			repoSlide = _repoSlide;
			repoProduct = _repoProduct;
		}
		public IActionResult Index()
		{
			IndexVM indexVM = new IndexVM()
			{
				Slides = repoSlide.GetAll().OrderByDescending(x => x.ID),
				LatestProducts = repoProduct.GetAll().Include(x => x.ProductPictures).OrderByDescending(x => x.ID).Take(16),
				SalesProducts = repoProduct.GetAll().Include(x => x.ProductPictures).OrderBy(x => Guid.NewGuid()).Take(8)
			};
			return View(indexVM);
		}
	}
}
