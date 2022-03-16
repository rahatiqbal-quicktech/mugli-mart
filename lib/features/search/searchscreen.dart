import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/features/category/Categories.dart';
import 'package:muglimart_quicktech/features/search/SeacrhResultModel.dart';
import 'package:muglimart_quicktech/features/search/searchresultscreen.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade50),
      bottomNavigationBar: const TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 3, 0, size.width * 3, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              whitespace(context, 6, 0),
              TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  icon: Icon(Ionicons.search_circle_outline),
                  hintText: 'Search products or category',
                  labelText: 'Search',
                ),
              ),
              whitespace(context, 2, 0),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResultScreen(
                                searchController.text.toString())),
                      );
                    },
                    icon: Icon(Ionicons.checkmark),
                    label: Text("Search"),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      side: BorderSide(color: Colors.grey),
                    )),
              ),
              whitespace(context, 5, 0),
              Text(
                "Popular Categories",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: size.height * 2,
                  fontStyle: FontStyle.italic,
                )),
              ),
              whitespace(context, 2, 0),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FutureBuilder<Categories>(
                      future: getCategoryList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot
                                        .data!.categories![index].catname
                                        .toString()),
                                    const Divider(),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Text("Loading.....");
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void search(String searchkey) async {
    try {
      SearchResultModel searchresult = SearchResultModel();
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/search/product"),
          body: {'category': "1", 'keyword': searchkey});

      if (response.statusCode == 200) {
        searchresult = jsonDecode(response.body.toString());
        // var token = data['token'];
        print(searchresult.toString());
        print("abc");
      } else {
        // var data = jsonDecode(response.body.toString());
        // print(data['error']);
        print("Not worked");
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
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
