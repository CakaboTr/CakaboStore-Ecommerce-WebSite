using CakaboStore.BL.Repositories;
using CakaboStore.DAL.Entities;
using CakaboStore.UI.Models;
using CakaboStore.UI.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace CakaboStore.UI.Controllers
{
	public class CartController : Controller
	{
		IRepository<Product> repoProduct;
		IRepository<Order> repoOrder;
		IRepository<OrderDetail> repoOrderDetail;
		public CartController(IRepository<Product> _repoProduct, IRepository<Order> _repoOrder, IRepository<OrderDetail> _repoOrderDetail)
		{
			repoProduct = _repoProduct;
			repoOrder = _repoOrder;
			repoOrderDetail = _repoOrderDetail;
		}

		[Route("/sepet/sepeteekle"), HttpPost]
		public string AddCart(int productid, int quantity)
		{
			Product product = repoProduct.GetAll(x => x.ID == productid).Include(x => x.ProductPictures).FirstOrDefault();
			if (product != null)
			{
				string resim;
				if (product.ProductPictures.FirstOrDefault().Picture == null)
					resim = "/img/ürün-görseli-hazırlanıyor.jpg";
				else
					resim = product.ProductPictures.FirstOrDefault().Picture;
				Cart cart = new Cart()
				{
					ProductID = productid,
					ProductName = product.Name,
					ProductPicture = resim,
					ProductPrice = product.Price,
					Quantity = quantity
				};
				List<Cart> carts = new List<Cart>();
				bool varMi = false;
				if (Request.Cookies["MyCart"] != null)
				{
					carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
					foreach (Cart c in carts)
					{
						if (c.ProductID == productid)
						{
							varMi = true;
							if (c.ProductID == productid) c.Quantity += quantity;
							break;
						}
					}
				}
				if (!varMi)
					carts.Add(cart);
				CookieOptions options = new();
				options.Expires = DateTime.Now.AddHours(3);
				Response.Cookies.Append("MyCart", JsonConvert.SerializeObject(carts), options);
				return product.Name;
			}
			else return "~ Ürün Bulunamadı";
		}
		// Deserialze verilen bir string değeri istediğim bir türe dönüştürmek için kullanılır.
		// Serialize metodu ise verilen türü stringe dönüştürür. (JSON formatında)


		[Route("/sepet/sepetsayisi")]
		public int CartCount()
		{
			int geri = 0;
			if (Request.Cookies["MyCart"] != null)
			{
				List<Cart> carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
				geri = carts.Sum(x => x.Quantity);
			}
			return geri;
		}

		[Route("/sepet/sepettensil"), HttpPost]
		public string RemoveCart(int productid)
		{
			string rtn = "";
			if (Request.Cookies["MyCart"] != null)
			{
				List<Cart> carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
				bool varMi = false;
				foreach (Cart c in carts)
				{
					if (c.ProductID == productid)
					{
						varMi = true;
						carts.Remove(c);
						break;
					}
				}
				if (varMi)
				{
					CookieOptions options = new();
					options.Expires = DateTime.Now.AddHours(3);
					Response.Cookies.Append("MyCart", JsonConvert.SerializeObject(carts), options);
					rtn = "OK";
				}
			}
			return rtn;
		}


		[Route("/sepet/alisverisitamamla")]
		public IActionResult CheckOut()
		{
			ViewBag.ShippingFee = 1000;
			if (Request.Cookies["MyCart"] != null)
			{
				List<Cart> carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
				CheckOutVM checkOutVM = new CheckOutVM()
				{
					Order = new Order(),
					Carts = carts
				};
				return View(checkOutVM);
			}
			else return Redirect("/");
		}


		[Route("/sepet/alisverisitamamla"), HttpPost, ValidateAntiForgeryToken]
		public IActionResult CheckOut(CheckOutVM model)
		{
			if (model.Order.PaymentOption == EPaymentOption.KrediKarti)
			{

			}

			model.Order.RecDate = DateTime.Now;
			string orderNumber = DateTime.Now.Microsecond.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Microsecond.ToString() + DateTime.Now.Microsecond.ToString();
			if (orderNumber.Length > 20)
			{
				orderNumber = orderNumber.Substring(0, 20);
			}
			model.Order.OrderNumber = orderNumber;
			model.Order.OrderStatus = EOrderStatus.Hazirlaniyor;
			repoOrder.Add(model.Order);
			List<Cart> carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
			foreach (Cart cart in carts)
			{
				OrderDetail orderDetail = new OrderDetail()
				{
					OrderID = model.Order.ID,
					ProductID = cart.ProductID,
					ProductName = cart.ProductName,
					ProductPicture = cart.ProductPicture,
					ProductPrice = cart.ProductPrice,
					Quantity = cart.Quantity,
				};
				repoOrderDetail.Add(orderDetail);
			}

			CookieOptions options = new();
			options.Expires = DateTime.Now.AddHours(-1);
			Response.Cookies.Append("MyCart", JsonConvert.SerializeObject(carts), options);
			return Redirect("/");
		}





		[Route("/sepet/")]
		public IActionResult Index()
		{
			if (Request.Cookies["MyCart"] != null)
			{
				List<Cart> carts = JsonConvert.DeserializeObject<List<Cart>>(Request.Cookies["MyCart"]);
				if (carts.Count <= 0)
				{
					return Redirect("/");
				}
				else return View(carts);

			}
			else return View("/");
		}
	}
}
