import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/features/cart/cartscreen.dart';
import 'package:muglimart_quicktech/features/product_details/productdetailsscreen.dart';
import 'package:muglimart_quicktech/main.dart';

productmodal(BuildContext context, String productid) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      context: context,
      builder: (context) {
        return Wrap(children: [
          Column(
            children: [
              ListTile(
                title: const Text("Show Details"),
                leading: const Icon(Ionicons.newspaper),
                onTap: () {
                  Get.to(ProductDetailsScreen(id: productid));
                },
              ),
              ListTile(
                title: const Text("Remove from cart"),
                leading: const Icon(Ionicons.trash),
                onTap: () {
                  cartSql.deleteProduct(productid);
                  Get.offAll(CartScreen());
                },
              ),
              ListTile(
                title: const Text("Report"),
                leading: const Icon(Ionicons.alert_circle),
                onTap: () {
                  Navigator.pushNamed(context, 'UnderConstructionScreen');
                },
              ),
            ],
          ),
        ]);
      });
}
