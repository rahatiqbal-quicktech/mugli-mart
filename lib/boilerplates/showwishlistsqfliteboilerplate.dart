import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/main.dart';

class ShowWishlistBoilerplate extends StatefulWidget {
  const ShowWishlistBoilerplate({Key? key}) : super(key: key);

  @override
  _ShowWishlistBoilerplateState createState() =>
      _ShowWishlistBoilerplateState();
}

class _ShowWishlistBoilerplateState extends State<ShowWishlistBoilerplate> {
  // variables
  List<Map<String, dynamic>> WishList = [];
  //
  @override
  void initState() {
    super.initState();
    fetchwishlist();
  }

  fetchwishlist() async {
    List<Map<String, dynamic>> list = await sqlHelper.fetchProducts();
    setState(() {
      WishList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: WishList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(WishList[index]["productname"]),
                  subtitle: Text(WishList[index]["productprice"].toString()),
                  leading: Image(
                      image: NetworkImage(
                          WishList[index]["productimage"].toString())),
                );
              })),
    );
  }
}
