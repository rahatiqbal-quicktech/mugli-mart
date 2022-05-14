import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/features/category_products/apiService.dart';
import 'package:muglimart_quicktech/features/category_products/category_product_model.dart';
import 'package:muglimart_quicktech/features/home/another_item_card.dart';
import 'package:muglimart_quicktech/features/product_details/productdetailsscreen.dart';
import 'package:http/http.dart' as http;

class CategoryProductsScreen extends StatefulWidget {
  String categoryId;
  CategoryProductsScreen({required this.categoryId, Key? key})
      : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    String baseUrl = "https://muglimart.com/";

    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      body: FutureBuilder<CategoryProducts>(
          future: getCategoryProductsAlternate(widget.categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    whitespace(context, 3, 0),
                    Text(
                      snapshot.data!.bredcrumb!.catname.toString(),
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    whitespace(context, 3, 0),
                    // ListView.separated(
                    //   scrollDirection: Axis.vertical,
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   itemCount: snapshot.data!.products!.data!.length,
                    //   itemBuilder: ((context, index) {
                    //     var temp = snapshot.data!.products!.data![index];
                    //     return ListTile(
                    //       onTap: () {
                    //         Get.to(
                    //             () => ProductDetailsScreen(id: "${temp.id}"));
                    //       },
                    //       leading: Image(
                    //           image: NetworkImage(
                    //               "$baseUrl${temp.proImage!.image}")),
                    //       title: Text(
                    //         temp.productname.toString(),
                    //         style: GoogleFonts.openSans(),
                    //         overflow: TextOverflow.ellipsis,
                    //         maxLines: 2,
                    //       ),
                    //       trailing: Text(
                    //         "${temp.productnewprice} tk",
                    //         style: GoogleFonts.openSans(),
                    //       ),
                    //     );
                    //   }),
                    //   separatorBuilder: (context, index) => Divider(),
                    // ),
                    SizedBox(
                      height: size.height * 85,
                      child: GridView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: snapshot.data?.products!.data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                (size.width * 1.1) / (size.height / 1.19),
                          ),
                          itemBuilder: (context, index) {
                            var temp = snapshot.data!.products!.data![index];
                            return anotherItemCard(
                                size,
                                temp.proImage?.image,
                                "${temp.productname}",
                                "${temp.productnewprice}",
                                "${temp.productoldprice}",
                                temp.productdiscount,
                                "${temp.id}",
                                context);
                          }),
                    )
                  ],
                ),
              );
            } else
              return Center(child: CupertinoActivityIndicator());
          }),
    );
  }

  Future<CategoryProducts> getCategoryProductsAlternate(
      String categoryId) async {
    final response = await http.get(Uri.parse(
        'https://muglimart.com/api/v1/category-products/$categoryId'));
    var data = response.body;
    if (response.statusCode == 200) {
      return categoryProductsFromJson(data);
    } else
      return CategoryProducts();
  }
}
