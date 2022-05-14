import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/features/category_products/widgets/category_products_gridview_widget.dart';

class AnotherCategoryProductScreen extends StatefulWidget {
  const AnotherCategoryProductScreen({Key? key}) : super(key: key);

  @override
  State<AnotherCategoryProductScreen> createState() =>
      _AnotherCategoryProductScreenState();
}

class _AnotherCategoryProductScreenState
    extends State<AnotherCategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        appBar: myappbar(context, size, Colors.black),
        bottomNavigationBar: TheBottomNavBar(),
        body: CategoryProductsGridviewWidget());
  }
}
