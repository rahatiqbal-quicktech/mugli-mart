import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Models/ProductDetailsModel.dart';
import 'package:muglimart_quicktech/Models/imageurl_forcarousel.dart';
import 'package:muglimart_quicktech/Screens/reviewsscreen.dart';
import 'package:muglimart_quicktech/Widgets/addtocartmodal.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/buttons.dart';
import 'package:muglimart_quicktech/Widgets/cartdialogue.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/main.dart';

class ProductDetailsScreen extends StatefulWidget {
  String id;
  // const ProductDetailsScreen({required this.id, Key? key}) : super(key: key);
  ProductDetailsScreen({required this.id});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String size_dropdownvalue = 'M';
  var size_items = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  String color_dropdownvalue = 'Red';
  var color_items = [
    'Red',
    'Blue',
    'Orange',
    'Black',
    'Green',
  ];
  ProductDetailsModel returnmodel = ProductDetailsModel();

  String nameofproduct = "";
  asigner(ProductDetailsModel tempmodel) {
    setState(() {
      nameofproduct = tempmodel.productdetails!.productname.toString();
    });
  }

  // The class name was not changed by mistake
  Future<ProductDetailsModel> GetDetails(String id) async {
    final response = await http
        .get(Uri.parse('https://muglimart.com/api/v1/product-details/' + id));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductDetailsModel.fromJson(data);
    } else {
      return ProductDetailsModel.fromJson(data);
    }
  }

  String imagelink(String apiLink) {
    String link = "https://muglimart.com/" + apiLink;
    return link;
  }

  addToWishlist(
      {required String sentid,
      required String sentproductname,
      required double sentproductprice,
      required String sentproductimage}) async {
    String fullimageurl = "https://muglimart.com/" + sentproductimage;
    try {
      int a = await sqlHelper.addProduct(
          sentid, sentproductname, sentproductprice, fullimageurl);

      if (a == 1) {
        print("Product Added ");
      } else if (a == 0) {
        print("Product Couldn't Be Added ");
      } else {
        print("SQL Issue");
      }
    } catch (e) {
      print(e);
    }
  }

  addToCart(
      {required String sentid,
      required String sentproductname,
      required double sentproductprice,
      required String sentproductimage}) async {
    String fullimageurl = "https://muglimart.com/" + sentproductimage;
    try {
      int a = await cartSql.addProduct(
          sentid, sentproductname, sentproductprice, fullimageurl);

      if (a == 1) {
        print("Product Added To Cart ");
      } else if (a == 0) {
        print("Product Couldn't Be Added To Cart ");
      } else {
        print("SQL Issue for Cart");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: blackappbar(context, size),
      bottomNavigationBar: const TheBottomNavBar(),
      body: SingleChildScrollView(
          child: FutureBuilder<ProductDetailsModel>(
              future: GetDetails(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          color: Colors.black,
                          height: size.height * 50,
                          width: double.infinity,
                          child:
                              // Center(
                              //   child: Text(
                              //     snapshot.data!.productdetails!.proImage!.image
                              //         .toString(),
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              // )
                              Image.network(
                            imagelink(snapshot
                                .data!.productdetails!.proImage!.image
                                .toString()),
                            fit: BoxFit.cover,
                          )
                          // CarouselSlider.builder(
                          //     itemCount: imageUrls.length,
                          //     itemBuilder: (context, index, realIndex) {
                          //       final image_url = imageUrls[index];
                          //       return buildimage(image_url, index);
                          //     },
                          //     options: CarouselOptions(height: double.infinity)),
                          ),
                      whitespace(context, 2, 0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11.8, 0, 11.8, 0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                snapshot.data!.productdetails!.productname
                                    .toString(),
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: size.height * 2.3,
                                  ),
                                )),
                            whitespace(context, 1.5, 0),
                            Text(
                              snapshot.data!.productdetails!.productnewprice
                                  .toString(),
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: size.height * 1.88,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            whitespace(context, 3.5, 0),
                            // Row(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Text("Size"),
                            //         whitespace(context, 0, 8),
                            //         DropdownButton(
                            //           value: size_dropdownvalue,
                            //           icon: Icon(Icons.keyboard_arrow_down),
                            //           items: size_items.map((String items) {
                            //             return DropdownMenuItem(
                            //                 value: items, child: Text(items));
                            //           }).toList(),
                            //           onChanged: (String? newValue) {
                            //             setState(() {
                            //               size_dropdownvalue = newValue!;
                            //             });
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //     whitespace(context, 0, 10),
                            //     Row(
                            //       children: [
                            //         Text("Color"),
                            //         whitespace(context, 0, 8),
                            //         DropdownButton(
                            //           value: color_dropdownvalue,
                            //           icon: Icon(Icons.keyboard_arrow_down),
                            //           items: color_items.map((String items) {
                            //             return DropdownMenuItem(
                            //                 value: items, child: Text(items));
                            //           }).toList(),
                            //           onChanged: (String? newValue) {
                            //             setState(() {
                            //               color_dropdownvalue = newValue!;
                            //             });
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            whitespace(context, 3, 0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return cartdialogue(
                                                context,
                                                size,
                                                snapshot.data!.productdetails!
                                                    .productname
                                                    .toString(),
                                                snapshot.data!.productdetails!
                                                    .productnewprice!
                                                    .toDouble(),
                                                snapshot
                                                    .data!.productdetails!.id
                                                    .toString(),
                                                imagelink(snapshot.data!
                                                    .productdetails!.proImage
                                                    .toString()));
                                          });
                                    },
                                    icon: Icon(Icons.shopping_bag_outlined),
                                    label: Text(
                                      "Add to Cart",
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.blue,
                                      side:
                                          BorderSide(color: Colors.blueAccent),
                                    )),
                                // outlinedButton(
                                //   label: "Add to Cart",
                                //   icon: Icons.shopping_bag_outlined,
                                //   primarycolor: Colors.blue,
                                //   bordercolor: Colors.blueAccent,
                                //   action: addtocartmodal(context),
                                // ),
                                // whitespace(context, 0, 2),
                                OutlinedButton.icon(
                                    onPressed: () {
                                      addToWishlist(
                                        sentid: snapshot
                                            .data!.productdetails!.id
                                            .toString(),
                                        sentproductname: snapshot
                                            .data!.productdetails!.productname
                                            .toString(),
                                        sentproductprice: snapshot.data!
                                            .productdetails!.productnewprice!
                                            .toDouble(),
                                        sentproductimage: snapshot.data!
                                            .productdetails!.proImage!.image
                                            .toString(),
                                      );
                                    },
                                    icon: Icon(Icons.favorite_border_rounded),
                                    label: Text("Add to Wishlist"),
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.redAccent,
                                      side: BorderSide(color: Colors.redAccent),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      cartSql.deleteProduct("13");
                                      print(snapshot.data!.productdetails!.id
                                          .toString());
                                    },
                                    child: Text("Print id"))
                                // productdetailstexts(
                                //     "4/5", size, 2, FontWeight.w600),
                              ],
                            ),
                            whitespace(context, 3.5, 0),
                            Html(
                                data: snapshot
                                    .data!.productdetails!.productdetails
                                    .toString()),
                            // Text(
                            //   snapshot.data!.productdetails!.productdetails
                            //       .toString(),
                            //   style: GoogleFonts.openSans(
                            //       textStyle: const TextStyle(
                            //     fontSize: 14,
                            //   )),
                            // ),
                            whitespace(context, 5, 0),
                            productdetailstexts(
                                "Reviews", size, 3, FontWeight.w600),
                            const Divider(),
                            productdetailstexts(
                                "300 Reviews", size, 2, FontWeight.normal),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ReviewsScreen()),
                                  );
                                },
                                child: const Text("Read all reviews")),
                            whitespace(context, 5, 0),
                            productdetailstexts(
                                "Ratings", size, 3, FontWeight.w600),
                            const Divider(),
                            productdetailstexts(
                                "155 Ratings", size, 2, FontWeight.normal),
                            TextButton(
                                onPressed: () {},
                                child: const Text("Check All Ratings")),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Container(
                    // height: double.infinity,
                    height: size.height * 80,
                    alignment: Alignment.center,
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  );
                }
              })),
    );
  }

  Widget buildimage(String url, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 11),
      color: Colors.red,
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget productdetailstexts(
      String text, Size size, double textsize, FontWeight weight) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          textStyle: TextStyle(
        fontSize: size.height * textsize,
        fontWeight: weight,
      )),
    );
  }

  Widget cartdialogue(BuildContext context, Size size, String productname,
      double productprice, String productid, String imageurl) {
    // String fullurl = "https://muglimart.com/" + imageurl;
    return Dialog(
      child: Container(
        width: size.width * 88,
        height: size.height * 35,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            whitespace(context, 2, 0),
            Text(
              productname,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              )),
            ),
            whitespace(context, 1.1, 0),
            Text("Price  " + productprice.toString()),
            whitespace(context, 1.1, 0),
            Text(
              "Total Price  " + productprice.toString(),
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              )),
            ),
            whitespace(context, 5, 0),
            // Text("Quantity"),
            // whitespace(context, 3, 0),
            // Row(
            //   children: [
            //     Text("Size"),
            //     whitespace(context, 0, 8),
            //     DropdownButton(
            //       value: size_dropdownvalue,
            //       icon: Icon(Icons.keyboard_arrow_down),
            //       items: size_items.map((String items) {
            //         return DropdownMenuItem(value: items, child: Text(items));
            //       }).toList(),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           size_dropdownvalue = newValue!;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            // whitespace(context, 3, 0),
            // Row(
            //   children: [
            //     Text("Color"),
            //     whitespace(context, 0, 8),
            //     DropdownButton(
            //       value: color_dropdownvalue,
            //       icon: Icon(Icons.keyboard_arrow_down),
            //       items: color_items.map((String items) {
            //         return DropdownMenuItem(value: items, child: Text(items));
            //       }).toList(),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           color_dropdownvalue = newValue!;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                child: Text('ADD'),
                onPressed: () {
                  addToCart(
                      sentid: productid,
                      sentproductname: productname,
                      sentproductprice: productprice,
                      sentproductimage: imageurl);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
