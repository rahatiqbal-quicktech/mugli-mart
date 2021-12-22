import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Models/SeacrhResultModel.dart';
import 'package:muglimart_quicktech/Screens/productdetailsscreen.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:http/http.dart' as http;

class SearchResultScreen extends StatefulWidget {
  String searchkey;
  SearchResultScreen(this.searchkey);
  // const SearchResultScreen({Key? key}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<SearchResultModel>(
              future: getSearchResult(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      GestureDetector(
                        child: ListTile(
                          title: Text(snapshot
                              .data!.products!.data![0].productname
                              .toString()),
                          subtitle: Text(snapshot
                              .data!.products!.data![0].productnewprice
                              .toString()),
                          // leading: Image(image: NetworkImage(snapshot.data!.products!.data![0].productname.toString())),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                      id: snapshot.data!.products!.data![0].id
                                          .toString(),
                                    )),
                          );
                        },
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<SearchResultModel> getSearchResult() async {
    final response = await http.post(
        Uri.parse('https://muglimart.com/api/v1/search/product'),
        body: {'category': "1", 'keyword': widget.searchkey});

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SearchResultModel.fromJson(data);
    } else {
      return SearchResultModel.fromJson(data);
    }
  }
}
