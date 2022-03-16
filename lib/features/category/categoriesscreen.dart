import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/category/Categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          FutureBuilder<Categories>(
              future: getCategoryList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data!.categories![index].catname.toString(),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.muglimart.com/" +
                                snapshot.data!.categories![index].image
                                    .toString(),
                          ),
                          backgroundColor: LogoColor,
                        ),
                      );
                    },
                  );
                } else {
                  return Text("Loading.....");
                }
              })
        ],
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
}
