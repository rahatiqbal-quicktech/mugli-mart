import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:muglimart_quicktech/AnotherSqlHelper.dart';
import 'package:muglimart_quicktech/CartSqlHelper.dart';
import 'package:muglimart_quicktech/HiveModel.dart';
import 'package:muglimart_quicktech/Models/product.dart';
import 'package:muglimart_quicktech/SQLHelper.dart';
import 'package:muglimart_quicktech/Screens/TrackOrderScreen.dart';
import 'package:muglimart_quicktech/Screens/campaignsscreen.dart';
import 'package:muglimart_quicktech/Screens/cartscreen.dart';
import 'package:muglimart_quicktech/Screens/changeadressscreen.dart';
import 'package:muglimart_quicktech/Screens/confirmorderscreen.dart';
import 'package:muglimart_quicktech/Screens/edit%20profile%20screen/editprofilescreen.dart';
import 'package:muglimart_quicktech/Screens/shippingaddressscreen.dart';
import 'package:muglimart_quicktech/boilerplates/demo.dart';
import 'package:muglimart_quicktech/Screens/homescreen.dart';
import 'package:muglimart_quicktech/Screens/loginscreen.dart';
import 'package:muglimart_quicktech/Screens/profilescreen.dart';
import 'package:muglimart_quicktech/Screens/searchscreen.dart';
import 'package:muglimart_quicktech/Screens/signupscreen.dart';
import 'package:muglimart_quicktech/Screens/underconstructionscreen.dart';
import 'package:muglimart_quicktech/Screens/wishlistscreen.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        'SearchScreen': (context) => const SearchScreen(),
        'Demo': (context) => const Demo(),
        'recommended_demo': (context) => recommended_demo(),
        'EditProfileScreen': (context) => EditProfileScreen(),
        'TrackOrderScreen': (context) => TrackOrderScreen(),
        'ShippingAdressScreen': (context) => ShippingAdressScreen(),
        'ChangeAddressScreen': (context) => ChangeAddressScreen(),
        'SqfliteBoilerplate': (context) => SqfliteBoilerplate(),
        'ShowWishlistBoilerplate': (context) => ShowWishlistBoilerplate(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConfirmOrderScreen(),
    );
  }
}
