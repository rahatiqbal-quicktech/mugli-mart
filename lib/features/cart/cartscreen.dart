// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muglimart_quicktech/features/order/confirmorderscreen.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/features/cart/productmodalssheets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/main.dart';

import 'widgets/bottom_proceed_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> CartList = [];
  double? totalPrice;
  final box = GetStorage();
  var phoneNumber;
  var fullName;
  //
  @override
  void initState() {
    super.initState();
    fetchwishlist();
    fetchTotalPrice();
    phoneNumber = box.read('phoneNumber');
    fullName = box.read('fullName');
  }

  fetchwishlist() async {
    List<Map<String, dynamic>> list = await cartSql.fetchProducts();
    setState(() {
      CartList = list;
    });
    // print(CartList.first["productimage"]);
  }

  double? subTotal;

  fetchTotalPrice() async {
    var temp = await cartSql.totalPrice();
    setState(() {
      totalPrice = temp;
      subTotal = (totalPrice!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      bottomNavigationBar: const TheBottomNavBar(),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 05, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartList.length != 0
                ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: CartList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                              height: size.height * 18,
                              margin: const EdgeInsets.all(3.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white70),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: size.width * 35,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Image.network(
                                      CartList[index]["productimage"]
                                          .toString(),
                                      // "https://mediaslide-europe.storage.googleapis.com/named/news_pictures/2018/10/large-1540206295-b16ecc226f0c7de6cd3348f340dc7427.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Image.network(
                                  //     'https://mediaslide-europe.storage.googleapis.com/named/news_pictures/2018/10/large-1540206295-b16ecc226f0c7de6cd3348f340dc7427.jpg'),
                                  whitespace(context, 0, 3),
                                  // RichText(text: text)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * 50,
                                          child: Text(
                                            CartList[index]["product_name"]
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Text(CartList[index]["product_price"]
                                                .toString() +
                                            " tk"),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                FractionalOffset.bottomRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    cartSql.deleteProduct(
                                                        CartList[index]
                                                            ["product_id"]);
                                                    setState(() {
                                                      fetchwishlist();
                                                    });
                                                    // Navigator.pushNamed(
                                                    //     context, "CartScreen");
                                                    // Get.offAll(CartScreen());
                                                  },
                                                  child: const Text(
                                                    "Remove",
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.redAccent,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () =>
                                                        productmodal(
                                                            context,
                                                            CartList[index]
                                                                ["product_id"]),
                                                    icon: const Icon(
                                                        Icons.more_horiz))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),
                  )
                : Column(
                    children: [
                      whitespace(context, 10, 0),
                      Center(child: Text("Your Cart Is Empty.")),
                    ],
                  ),
            // whitespace(context, 2, 0),
            CartList.length != 0
                ? BottomProceedWidget(
                    fullName: fullName,
                    size: size,
                    subTotal: subTotal,
                    phoneNumber: phoneNumber,
                    totalPrice: totalPrice)
                : Container(),
          ],
        ),
      ),
    );
  }
}
