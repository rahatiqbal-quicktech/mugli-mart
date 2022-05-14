import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/search/SeacrhResultModel.dart';
import 'package:muglimart_quicktech/features/product_details/productdetailsscreen.dart';
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
                  if (snapshot.data!.products!.data!.length != 0) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.products!.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ListTile(
                              //  leading: Image(
                              // image: NetworkImage(
                              //     "$baseUrl${snapshot.data.products}")),
                              title: Text(snapshot
                                  .data!.products!.data![0].productname
                                  .toString()),
                              subtitle: Text(
                                  "${snapshot.data!.products!.data![0].productnewprice.toString()} tk"),
                              // leading: Image(image: NetworkImage(snapshot.data!.products!.data![0].productname.toString())),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                          id: snapshot
                                              .data!.products!.data![0].id
                                              .toString(),
                                        )),
                              );
                            },
                          );
                        });
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 50,
                        ),
                        whitespace(context, 2, 0),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "${widget.searchkey} is not found",
                              style: GoogleFonts.openSans(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
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
    print(
        "This is search key - getSearchResult function - ${widget.searchkey}");
    final response = await http.post(
        Uri.parse('https://muglimart.com/api/v1/search/product'),
        body: {'category': "all", 'keyword': widget.searchkey});

    var data = jsonDecode(response.body.toString());
    print(response.body);

    if (response.statusCode == 200) {
      return SearchResultModel.fromJson(data);
    } else {
      return SearchResultModel.fromJson(data);
    }
  }
}
