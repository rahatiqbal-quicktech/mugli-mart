import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';

import 'package:muglimart_quicktech/features/splash_screen/splash_screen.dart';
import 'package:muglimart_quicktech/sqflite/AnotherSqlHelper.dart';
import 'package:muglimart_quicktech/sqflite/CartSqlHelper.dart';
import 'package:muglimart_quicktech/features/track_order/TrackOrderScreen.dart';
import 'package:muglimart_quicktech/features/campaigns/campaignsscreen.dart';
import 'package:muglimart_quicktech/features/cart/cartscreen.dart';
import 'package:muglimart_quicktech/features/change_address/changeadressscreen.dart';
import 'package:muglimart_quicktech/features/edit_profile/editprofilescreen.dart';
import 'package:muglimart_quicktech/features/shipping_address/shippingaddressscreen.dart';
import 'package:muglimart_quicktech/boilerplates/demo.dart';
import 'package:muglimart_quicktech/features/home/homescreen.dart';
import 'package:muglimart_quicktech/features/auth/loginscreen.dart';
import 'package:muglimart_quicktech/features/profile/profilescreen.dart';
import 'package:muglimart_quicktech/features/search/searchscreen.dart';
import 'package:muglimart_quicktech/features/auth/signupscreen.dart';
import 'package:muglimart_quicktech/features/under_construction/underconstructionscreen.dart';
import 'package:muglimart_quicktech/features/wish_list/wishlistscreen.dart';
import 'package:muglimart_quicktech/boilerplates/recommended_demo.dart';
import 'package:muglimart_quicktech/boilerplates/showwishlistsqfliteboilerplate.dart';
import 'package:muglimart_quicktech/boilerplates/sqfliteboilerplate.dart';

AnotherSqlHelper sqlHelper = AnotherSqlHelper();
CartSqlHelper cartSql = CartSqlHelper();
// late SQLHelper sqlHelper;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  await sqlHelper.initialize();
  await cartSql.initialize();
  //  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  // sqlHelper.addProduct("11", "Football", 123,
  //     "https://images.pexels.com/photos/3074920/pexels-photo-3074920.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
  // sqlHelper.addProduct("20", "Football another", 123,
  //     "https://images.pexels.com/photos/3074920/pexels-photo-3074920.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
  // sqlHelper.addProduct("30", "Club lol", 123, "imagelinklol");

  // Hive.registerAdapter(WishListAdapter());
  // await Hive.openBox<WishList>('WishListBox');
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with AllControllers {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    categoriesController.fetchCategories();
    sliderController.getSliders();
    recommendedProductsController.getRecommendedProducts();
    return GetMaterialApp(
      // initialRoute: 'LoginScreen',
      routes: {
        'LoginScreen': (context) => const LoginScreen(),
        'SignUpScreen': (context) => const SignUpScreen(),
        'HomeScreen': (context) => const HomeScreen(),
        'WishListScreen': (context) => const WishListScreen(),
        'CartScreen': (context) => const CartScreen(),
        // 'ProductDetailsScreen': (context) => ProductDetailsScreen(
        //       id: "15",
        //     ),
        'ProfileScreen': (context) => const ProfileScreen(),
        'CampaignScreen': (context) => const CampaignScreen(),
        'UnderConstructionScreen': (context) => const UnderConstructionScreen(),
        'SearchScreen': (context) => SearchScreen(),
        'Demo': (context) => const Demo(),
        'recommended_demo': (context) => recommended_demo(),
        // 'EditProfileScreen': (context) => EditProfileScreen(),
        'TrackOrderScreen': (context) => TrackOrderScreen(),
        'ShippingAdressScreen': (context) => ShippingAdressScreen(),
        'ChangeAddressScreen': (context) => ChangeAddressScreen(),
        'SqfliteBoilerplate': (context) => SqfliteBoilerplate(),
        'ShowWishlistBoilerplate': (context) => ShowWishlistBoilerplate(),
      },
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
