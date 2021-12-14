import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Models/imageurl_forcarousel.dart';
import 'package:muglimart_quicktech/Screens/reviewsscreen.dart';
import 'package:muglimart_quicktech/Widgets/addtocartmodal.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/buttons.dart';
import 'package:muglimart_quicktech/Widgets/cartdialogue.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: blackappbar(context, size),
      bottomNavigationBar: const TheBottomNavBar(),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            height: size.height * 50,
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  final image_url = imageUrls[index];
                  return buildimage(image_url, index);
                },
                options: CarouselOptions(height: double.infinity)),
          ),
          whitespace(context, 2, 0),
          Padding(
            padding: const EdgeInsets.fromLTRB(11.8, 0, 11.8, 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LOGO PLAY CROPPED HOODIE",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 2.3,
                      ),
                    )),
                whitespace(context, 1.5, 0),
                Text(
                  "Price 1520tk",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                    fontSize: size.height * 1.88,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                whitespace(context, 3.5, 0),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("Size"),
                        whitespace(context, 0, 8),
                        DropdownButton(
                          value: size_dropdownvalue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: size_items.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              size_dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    whitespace(context, 0, 10),
                    Row(
                      children: [
                        Text("Color"),
                        whitespace(context, 0, 8),
                        DropdownButton(
                          value: color_dropdownvalue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: color_items.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              color_dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                whitespace(context, 3, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return cartdialogue(context, size);
                              });
                        },
                        icon: Icon(Icons.shopping_bag_outlined),
                        label: Text(
                          "Add to Cart",
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.blue,
                          side: BorderSide(color: Colors.blueAccent),
                        )),
                    // outlinedButton(
                    //   label: "Add to Cart",
                    //   icon: Icons.shopping_bag_outlined,
                    //   primarycolor: Colors.blue,
                    //   bordercolor: Colors.blueAccent,
                    //   action: addtocartmodal(context),
                    // ),
                    // whitespace(context, 0, 2),
                    outlinedButton(
                      label: "Add to Wishlist",
                      icon: Icons.favorite_border_rounded,
                      primarycolor: Colors.redAccent,
                      bordercolor: Colors.redAccent,
                      action: () {},
                    ),
                    productdetailstexts("4/5", size, 2, FontWeight.w600),
                  ],
                ),
                whitespace(context, 3.5, 0),
                Text(
                  "In the future, these models will help us map the stream of data coming from a database so that these are ready to be used in the user interface. As we do not have set up our database yet, we will also use these models to store static lists of sample data.The Food Delivery Series is a journey to build a production Food Delivery app from scratch using Flutter. The series will take you through the development cycle of an app business from planning to design, development and testing. By the end of the series, the app will be launched and live on iOS and Android devices.",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                    fontSize: 14,
                  )),
                ),
                whitespace(context, 5, 0),
                productdetailstexts("Reviews", size, 3, FontWeight.w600),
                const Divider(),
                productdetailstexts("300 Reviews", size, 2, FontWeight.normal),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewsScreen()),
                      );
                    },
                    child: const Text("Read all reviews")),
                whitespace(context, 5, 0),
                productdetailstexts("Ratings", size, 3, FontWeight.w600),
                const Divider(),
                productdetailstexts("155 Ratings", size, 2, FontWeight.normal),
                TextButton(
                    onPressed: () {}, child: const Text("Check All Ratings")),
              ],
            ),
          )
        ],
      )),
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

  Widget cartdialogue(BuildContext context, Size size) {
    return Dialog(
      child: Container(
        width: size.width * 88,
        height: size.height * 65,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            whitespace(context, 2, 0),
            Text(
              "Logo Play Cropped Hoodie",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              )),
            ),
            whitespace(context, 1.1, 0),
            Text("Price 1500 taka"),
            whitespace(context, 1.1, 0),
            Text(
              "Total 1500 tk",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              )),
            ),
            whitespace(context, 5, 0),
            Text("Quantity"),
            whitespace(context, 3, 0),
            Row(
              children: [
                Text("Size"),
                whitespace(context, 0, 8),
                DropdownButton(
                  value: size_dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: size_items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      size_dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
            whitespace(context, 3, 0),
            Row(
              children: [
                Text("Color"),
                whitespace(context, 0, 8),
                DropdownButton(
                  value: color_dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: color_items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      color_dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                child: Text('ADD'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
