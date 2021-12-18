import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muglimart_quicktech/Models/product.dart';
import 'package:muglimart_quicktech/Screens/campaignsscreen.dart';
import 'package:muglimart_quicktech/Screens/cartscreen.dart';
import 'package:muglimart_quicktech/boilerplates/demo.dart';
import 'package:muglimart_quicktech/Screens/homescreen.dart';
import 'package:muglimart_quicktech/Screens/loginscreen.dart';
import 'package:muglimart_quicktech/Screens/productdetailsscreen.dart';
import 'package:muglimart_quicktech/Screens/profilescreen.dart';
import 'package:muglimart_quicktech/Screens/reviewsscreen.dart';
import 'package:muglimart_quicktech/Screens/searchscreen.dart';
import 'package:muglimart_quicktech/Screens/signupscreen.dart';
import 'package:muglimart_quicktech/Screens/underconstructionscreen.dart';
import 'package:muglimart_quicktech/Screens/wishlistscreen.dart';
import 'package:muglimart_quicktech/boilerplates/recommended_demo.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'HomeScreen',
      routes: {
        'LoginScreen': (context) => const LoginScreen(),
        'SignUpScreen': (context) => const SignUpScreen(),
        'HomeScreen': (context) => const HomeScreen(),
        'WishListScreen': (context) => const WishListScreen(),
        'CartScreen': (context) => const CartScreen(),
        'ProductDetailsScreen': (context) => const ProductDetailsScreen(),
        'ProfileScreen': (context) => const ProfileScreen(),
        'CampaignScreen': (context) => const CampaignScreen(),
        'UnderConstructionScreen': (context) => const UnderConstructionScreen(),
        'SearchScreen': (context) => const SearchScreen(),
        'Demo': (context) => const Demo(),
        'recommended_demo': (context) => recommended_demo(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
