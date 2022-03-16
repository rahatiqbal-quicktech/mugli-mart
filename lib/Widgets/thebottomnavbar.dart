import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/features/campaigns/campaignsscreen.dart';
import 'package:muglimart_quicktech/features/cart/cartscreen.dart';
import 'package:muglimart_quicktech/features/home/homescreen.dart';
import 'package:muglimart_quicktech/features/search/searchscreen.dart';
import 'package:muglimart_quicktech/features/wish_list/wishlistscreen.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class TheBottomNavBar extends StatefulWidget {
  const TheBottomNavBar({Key? key}) : super(key: key);

  @override
  _TheBottomNavBarState createState() => _TheBottomNavBarState();
}

class _TheBottomNavBarState extends State<TheBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CampaignScreen()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WishListScreen()));
        break;
      case 4:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb_outline_rounded),
          label: 'Campaigns',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded),
          label: 'Cart',
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black87,
      onTap: _onItemTapped,
    );
  }
}
