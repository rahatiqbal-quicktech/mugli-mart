import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/recommended_prdoucts/RecommendedModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class recommended_demo extends StatefulWidget {
  const recommended_demo({Key? key}) : super(key: key);

  @override
  _recommended_demoState createState() => _recommended_demoState();
}

class _recommended_demoState extends State<recommended_demo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommended Demo (from Boilerplate)"),
      ),
      body: FutureBuilder<RecommendedModel>(
          future: getRecommended(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: size.height * 71,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 5,
                      // crossAxisSpacing: 5,
                      childAspectRatio: 0.77,
                    ),
                    itemCount: snapshot.data!.products!.data!.length,
                    itemBuilder: (context, index) => anotheritemcard(
                        size,
                        "https://www.muglimart.com/" +
                            snapshot
                                .data!.products!.data![index].proImage!.image
                                .toString(),
                        snapshot.data!.products!.data![index].productname
                            .toString(),
                        snapshot.data!.products!.data![index].productnewprice
                            .toString())),
              );

              // ListView.builder(
              //     itemCount: snapshot.data!.products!.data!.length,
              //     itemBuilder: (context, index) {
              //       return Center(
              //           child: Column(
              //         children: [
              //           Text("https://www.muglimart.com/" +
              //               snapshot
              //                   .data!.products!.data![index].proImage!.image
              //                   .toString()),
              //           whitespace(context, 5, 0),

              //           // Image.network(snapshot
              //           //     .data!.campaigns![index].image
              //           //     .toString()),
              //           // Text(snapshot.data!.sliders![index].image
              //           //     .toString())
              //         ],
              //       ));
              //     });
            } else {
              return Text("Loading.....");
            }
          }),
    );
  }

  Widget anotheritemcard(
      var size, String url, String productname, String price) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'ProductDetailsScreen'),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // padding: const EdgeInsets.all(3),
              color: Colors.black38,
              width: double.infinity,
              height: size.height * 26,
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            whitespace(context, 2, 0),
            Text(
              productname,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(price),
          ],
        ),
      ),
    );
  }

  Future<RecommendedModel> getRecommended() async {
    final response = await http
        .get(Uri.parse('https://muglimart.com/api/v1/category-products/1'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return RecommendedModel.fromJson(data);
    } else {
      return RecommendedModel.fromJson(data);
    }
  }
}
