import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';
import 'package:muglimart_quicktech/features/home/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AllControllers {
  @override
  void initState() {
    super.initState();
    categoriesController.fetchCategories();
    recommendedProductsController.getRecommendedProducts();
    sliderController.getSliders();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(
            "assets/images/banner.png",
          ),
          height: 150,
        ),
      ),
    );
  }
}
