import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/features/category/Categories.dart';
import 'package:muglimart_quicktech/Models/Product.dart';
import 'package:muglimart_quicktech/Models/SliderModel.dart';
import 'package:muglimart_quicktech/features/product_details/productdetailsscreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/bottomnavbar.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;

import '../recommended_prdoucts/RecommendedProductsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Product product = Product();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://muglimart.com/";
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      bottomNavigationBar: const TheBottomNavBar(),

      // Row(
      //   children: <Widget>[
      //     // navbar(context, Icons.home_outlined, true, 0),
      //     BottomNavBar(context, Icons.home_outlined, 0),
      //     BottomNavBar(context, Icons.search, 1),
      //     BottomNavBar(context, Icons.lightbulb_outline_rounded, 2),
      //     BottomNavBar(context, Icons.favorite_outline_outlined, 3),
      //     BottomNavBar(context, Icons.shopping_bag_outlined, 4),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<SliderModel>(
                  future: getSliders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              height: size.height * 20,
                              // color: Colors.red,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  baseUrl +
                                      snapshot.data!.sliders![0].image
                                          .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );

                            // Center(
                            //     child: Text(snapshot.data!.sliders![index].image
                            //         .toString()));
                          });
                    } else {
                      return LinearProgressIndicator();
                    }
                  }),

              whitespace(context, 1.1, 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    textbuttonwidget(size, "Food", Ionicons.beer_outline),
                    textbuttonwidget(size, "Ride", Ionicons.car_outline),
                    textbuttonwidget(size, "Agro", Ionicons.leaf_outline),
                    textbuttonwidget(
                        size, "Medicine", Ionicons.medical_outline),
                  ],
                ),
              ),
              // whitespace(context, 2, 0),
              // SizedBox(
              //   height: size.height * 15,
              //   child: ListView.builder(
              //       itemCount: 4,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           height: size.height * 10,
              //           width: size.height * 10,
              //           margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             // color: Colors.black,
              //           ),
              //           child: const Center(
              //             child: Text(
              //               "Food",
              //               style: TextStyle(color: Colors.black),
              //             ),
              //           ),
              //         );
              //       }),
              // ),
              whitespace(context, 3, 0),
              Text(
                "Categories",
                style: TextStyle(
                  color: basiccolor,
                  fontSize: size.height * 2.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
              whitespace(context, 2.2, 0),
              FutureBuilder<Categories>(
                  future: getCategoryList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: size.height * 20,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.categories!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: size.height * 10,
                                    width: size.height * 15,
                                    margin: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.muglimart.com/" +
                                                  snapshot.data!
                                                      .categories![index].image
                                                      .toString()),
                                          fit: BoxFit.cover),
                                      // borderRadius: BorderRadius.circular(50),
                                      shape: BoxShape.circle,
                                      // color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 30,
                                    child: Text(
                                      snapshot.data!.categories![index].catname
                                          .toString(),
                                      softWrap: true,
                                      // "TV & Home Appliances$index",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
                    } else {
                      return Text("Loading.....");
                    }
                  }),
              // whitespace(context, 2.2, 0),

              whitespace(context, 2.8, 0),
              Container(
                // alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                height: size.height * 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(
                        "https://www.muglimart.com/public/uploads/banner/1639484431-ezgif.com-gif-maker%20(4).gif"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              whitespace(context, 2.6, 0),
              Text(
                "Recommended For You",
                style: TextStyle(
                    color: basiccolor,
                    fontSize: size.height * 2.6,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
              whitespace(context, 2, 0),
              // SizedBox(
              //   height: size.height * 50,
              //   child: ListView.builder(
              //       itemCount: 10,
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           height: size.height * 22,
              //           width: size.height * 15,
              //           margin: const EdgeInsets.all(3.5),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Colors.black54),
              //           child: Center(
              //             child: Text(
              //               "Product $index",
              //               style: const TextStyle(color: Colors.white),
              //             ),
              //           ),
              //         );
              //       }),
              // ),
              // SizedBox(
              //   height: size.height * 71,
              //   child: GridView.builder(
              //       gridDelegate:
              //           const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         // mainAxisSpacing: 5,
              //         // crossAxisSpacing: 5,
              //         childAspectRatio: 0.77,
              //       ),
              //       itemBuilder: (context, index) => anotheritemcard(size)),
              // ),
              FutureBuilder<RecommendedProductsModel>(
                  future: getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: size.height * 71,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // mainAxisSpacing: 5,
                              // crossAxisSpacing: 5,
                              childAspectRatio: 0.77,
                            ),
                            itemCount: snapshot.data!.products!.length,
                            itemBuilder: (context, index) => anotheritemcard(
                                size,
                                "https://www.muglimart.com/" +
                                    snapshot
                                        .data!.products![index].proImage!.image
                                        .toString(),
                                snapshot.data!.products![index].productname
                                    .toString(),
                                snapshot.data!.products![index].productnewprice
                                    .toString(),
                                snapshot.data!.products![index].productoldprice
                                    .toString(),
                                snapshot.data!.products![index].productdiscount,
                                snapshot.data!.products![index].id.toString())),
                      );
                    } else {
                      return Text("Loading.....");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget textbuttonwidget(var size, String texts, IconData buttonicon) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, 'UnderConstructionScreen');
      },
      icon: Icon(buttonicon),
      label: Text(
        texts,
        style: TextStyle(
          fontSize: size.width * 3.88,
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    );
  }

  double kDefaultPaddin = 10;
  String url =
      "https://cdn1.dumpor.com/view?q=%3DMDOmZmY30DZpN3Xj52XmUDOyMTNCFjN9U2bmczYwMmMkdDN4QWOmZDZ2EWMxQjMhdTN2U2YmVzNjFTY9g2bmQTL30jYjNmJBFUQBJ0ZNBDZmJUQ90GZlZScSpkWthDWBtGUUhWZWF2d59Ed9MGav91Yu9lJ5ATM9QXYj91Yu9lJt92Yu0WYydWY0Nnbp5GZj5SMtMDblhWL05WZ052bjNXP0h2Xj52X%2FcGcq5ibfFTO2IDMzcDOwEjN0UjMykDN0czX3MTO1cTMyUjMxkDOwgTOy8FN3QTN2QjM2IzLwgDMxgHM4ATMw9SNxU2LyZ2L1ETL1gDOy4SM1Q3L29SbvNmLtFmcnFGdz5WauR2YuETLzwWZo1CduVGdu92Yz9yL6MHc0RHa";

  Future<RecommendedProductsModel> getRecommended() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/all-product'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return RecommendedProductsModel.fromJson(data);
    } else {
      return RecommendedProductsModel.fromJson(data);
    }
  }

  Widget anotheritemcard(var size, String url, String productname, String price,
      String oldprice, int? discount, String idno) {
    return GestureDetector(
      onTap: () {
        // Get.to(ProductDetailsScreen(id: idno));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                    id: idno,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  // padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  width: double.infinity,
                  height: size.height * 26,
                  child: Image.network(
                    url,
                    // fit: BoxFit.cover,
                  ),
                ),
                discount != null
                    ? Positioned.fill(
                        child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 20,
                          width: 45,
                          decoration: BoxDecoration(
                              color: LogoColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "$discount %",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ))
                    : Container(),
              ],
            ),
            whitespace(context, 2, 0),
            Text(
              productname,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(price),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: oldprice,
                  style: GoogleFonts.openSans(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 11,
                    color: Colors.grey.shade700,
                  )),
              TextSpan(text: "   "),
              TextSpan(
                  text: "$price ৳",
                  style: GoogleFonts.openSans(
                    // fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
            ])),
          ],
        ),
      ),
    );
  }

  Future<Categories> getCategoryList() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/category'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Categories.fromJson(data);
    } else {
      return Categories.fromJson(data);
    }
  }

  Future<SliderModel> getSliders() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/slider'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SliderModel.fromJson(data);
    } else {
      return SliderModel.fromJson(data);
    }
  }

  // Future<SliderModel> getRecommended() async {
  //   final response =
  //       await http.get(Uri.parse('https://muglimart.com/api/v1/slider'));

  //   var data = jsonDecode(response.body.toString());

  //   if (response.statusCode == 200) {
  //     return SliderModel.fromJson(data);
  //   } else {
  //     return SliderModel.fromJson(data);
  //   }
  // }
}

class BOILERPLATE {
  Widget old_categories_widget(Size size) {
    return SizedBox(
      height: size.height * 15,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: size.height * 10,
              width: size.height * 15,
              margin: const EdgeInsets.all(3.5),
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(50),
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "TV & Home Appliances$index",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget old_campaign_container(Size size) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      height: size.height * 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff6675D2),
      ),
      child: RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: "50% off",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 10,
              fontWeight: FontWeight.w600,
            )),
        TextSpan(
            text: "\non all products",
            style: TextStyle(
              color: Colors.white.withOpacity(0.88888),
              fontSize: size.width * 5,
              fontWeight: FontWeight.w600,
            )),
      ])),
    );
  }
}
