import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';
import 'package:muglimart_quicktech/features/category/Categories.dart';
import 'package:muglimart_quicktech/features/category_products/category_products_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AllControllers {
  @override
  void initState() {
    super.initState();
    categoriesController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        appBar: myappbar(context, size, Colors.grey.shade100),
        bottomNavigationBar: TheBottomNavBar(),
        body: SizedBox(
          child: Obx(() {
            // var temp = categoriesController.categoriesList_;
            return categoriesController.categoriesList_.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: categoriesController.categoriesList_.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(() => CategoryProductsScreen(
                              categoryId:
                                  "${categoriesController.categoriesList_[index].id}"));
                        },
                        title: Text(
                          "${categoriesController.categoriesList_[index].catname}",
                        ),
                        leading: CachedNetworkImage(
                          imageUrl: "https://www.muglimart.com/" +
                              categoriesController.categoriesList_[index].image
                                  .toString(),
                          placeholder: (context, url) => const CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          imageBuilder: (context, image) => CircleAvatar(
                            backgroundImage: image,
                          ),
                        ),

                        // CircleAvatar(
                        //   backgroundImage: CachedNetworkImageProvider(
                        //     "https://www.muglimart.com/" +
                        //         categoriesController
                        //             .categoriesList_[index].image
                        //             .toString(),

                        //     // 'https://via.placeholder.com/350x150',
                        //   ),
                        //   // NetworkImage(
                        //   //   "https://www.muglimart.com/" +
                        //   //       categoriesController
                        //   //           .categoriesList_![index].image
                        //   //           .toString(),
                        //   // ),
                        //   backgroundColor: LogoColor,
                        // ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ));
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
