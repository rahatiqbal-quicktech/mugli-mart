import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      bottomNavigationBar: const TheBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 05, 0),
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
                      color: Colors.grey.shade200),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Add To Cart",
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.blueAccent,
                                      ),
                                    ),
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
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_horiz))
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
    );
  }
}
