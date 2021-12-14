class Products {
  final String? productname;
  final String? imageurl;
  final String? price;
  final String? details;
  final String? totalreviews;

  Products(
      {required this.productname,
      required this.imageurl,
      required this.details,
      required this.price,
      required this.totalreviews});

  List<Products> products = [
    Products(
        productname: "HARDEN FOUNDATION PULLOVER",
        imageurl:
            "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/ed8ab39b96aa4258909aad140031ed6e_9366/Harden_Foundation_Pullover_Black_H50862_21_model.jpg",
        details: "A FLEECE PULLOVER FOR FANS OF HARDEN'S STYLE.",
        price: "1500",
        totalreviews: "10"),
    Products(
        productname: "SANTIAGO LUNCH BAG",
        imageurl:
            "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/6415125bf9ed4b2998c6aca10059c981_9366/Santiago_Lunch_Bag_Blue_EX6533_01_standard.jpg",
        details:
            "Training takes work. Pack up this adidas lunch bag and keep your body refueled and recharged. Insulated to keep your lunch cool, it's got a roomy main pocket and a front pocket for easy access to snacks. A clip on the top lets you attach it to another bag so you never leave it behind.",
        price: "25",
        totalreviews: "50"),
    Products(
        productname: "SQUAD LUNCH BAG",
        imageurl:
            "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/46aa55afed46471f9f81ac9101451ffc_9366/Squad_Lunch_Bag_Black_EX6973_01_standard.jpg",
        details:
            "For those long dawn-to-dark type of days, pack up this adidas lunch bag and get hustling. Roomy enough for lunch and snacks, the insulated design keeps food cool from your early morning workout to your late evening at work. Plus, the easy-to-clean design makes it a cinch to wipe down at the end of the day.",
        price: "450",
        totalreviews: "100"),
    Products(
        productname:
            "For those long dawn-to-dark type of days, pack up this adidas lunch bag and get hustling. Roomy enough for lunch and snacks, the insulated design keeps food cool from your early morning workout to your late evening at work. Plus, the easy-to-clean design makes it a cinch to wipe down at the end of the day.",
        imageurl:
            "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/949e1d85cbc441fe9d58ad1300f51c2c_9366/Harden_Foundation_Pants_Black_H50859_21_model.jpg",
        details:
            "Harden sets his own style. Show your support in these adidas basketball pants. AEROREADY manages moisture to keep you feeling dry and ready for the next move. Soft polar fleece adds warmth from the sidewalk to the sideline.",
        price: "100",
        totalreviews: "35"),
    Products(
        productname: "ALL COURT 2.0 BASKETBALL",
        imageurl:
            "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/8d1778943c7644a9bd01abfb0127cc46_9366/All_Court_2.0_Basketball_Black_GL3946_01_standard.jpg",
        details:
            "Come ready to play with this adidas All Court 2.0 Basketball. Its official size and synthetic leather finish give it an authentic feel as you load up a shot. With a durable build, it's designed for play on any surface, from the blacktop to the hardwood.",
        price: "56",
        totalreviews: "60"),
  ];
}
