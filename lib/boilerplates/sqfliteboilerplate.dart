import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muglimart_quicktech/sqflite/SQLHelper.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/main.dart';

import '../hive_database/HiveModel.dart';

class SqfliteBoilerplate extends StatefulWidget {
  const SqfliteBoilerplate({Key? key}) : super(key: key);

  @override
  _SqfliteBoilerplateState createState() => _SqfliteBoilerplateState();
}

class _SqfliteBoilerplateState extends State<SqfliteBoilerplate> {
  List<Map<String, dynamic>> thelist = [];
  Future<List<Map<String, dynamic>>> getwishlist() async {
    thelist = await sqlHelper.fetchProducts();
    return thelist;
  }

  @override
  Widget build(BuildContext context) {
    SQLHelper helper = new SQLHelper();
    TextEditingController textcontroller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: textcontroller,
            ),
            whitespace(context, 1.5, 0),
            TextButton(
                onPressed: () async {
                  // helper.addProduct(
                  //     textcontroller.text, "productname", 1500, "123");
                  WishList data = new WishList(
                      name: "Demo",
                      id: textcontroller.text,
                      price: "5000",
                      image: "imageLink");
                  var box = await Hive.openBox<WishList>('wishlist');
                  box.add(data);
                },
                child: Text(
                  "Add Data",
                  style: TextStyle(color: basiccolor, fontSize: 23),
                )),
            whitespace(context, 1.5, 0),
            TextButton(
                onPressed: () async {
                  final box = await Hive.openBox<WishList>('wishlist');
                  print(box.values.first.id.toString());
                  print(box.values.first.image.toString());
                },
                child: Text(
                  "Get Data",
                  style: TextStyle(color: basiccolor, fontSize: 23),
                )),
            // TextButton(
            //   style: ButtonStyle(
            //       padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
            //   onPressed: () {
            //     // Navigator.pushNamed(context, 'LoginScreen');
            //   },
            //   child: Text(
            //     "Update",
            //     style: TextStyle(color: basiccolor, fontSize: 23),
            //   ),
            // ),
            // Text(
            //   "data",
            //   style: TextStyle(
            //     fontSize: 30,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
