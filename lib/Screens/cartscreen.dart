// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/productmodalssheets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
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
                                "https://mediaslide-europe.storage.googleapis.com/named/news_pictures/2018/10/large-1540206295-b16ecc226f0c7de6cd3348f340dc7427.jpg",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Adidas Blue Jacket",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Text("Price 1500tk"),
                                  Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Remove",
                                            ),
                                            style: TextButton.styleFrom(
                                              primary: Colors.redAccent,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () =>
                                                  productmodal(context),
                                              icon:
                                                  const Icon(Icons.more_horiz))
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
            ),
            // whitespace(context, 2, 0),
            Container(
              padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
              height: size.height * 11.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black87,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Fee 200 Tk",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      whitespace(context, 1.1, 0),
                      Row(
                        children: [
                          const Text(
                            "Total ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          whitespace(context, 0, 2),
                          const Text(
                            "20000 Taka",
                            style: TextStyle(
                                decorationColor: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Proceed'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
