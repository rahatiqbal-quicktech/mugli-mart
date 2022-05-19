import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';
import 'package:muglimart_quicktech/features/home/another_item_card.dart';

class RecommendedProductsWidget extends StatelessWidget with AllControllers {
  final Size? size;
  RecommendedProductsWidget({this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (recommendedProductsController.recommendedProductsList.isNotEmpty) {
          var list = recommendedProductsController.recommendedProductsList;
          return GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 5,
                // crossAxisSpacing: 5,
                childAspectRatio: (size!.width * 1.1) / (size!.height / 1.19),
              ),
              itemCount: list.length,
              itemBuilder: (context, index) => anotherItemCard(
                  size,
                  list[index].proImage?.image,
                  list[index].productname.toString(),
                  list[index].productnewprice.toString(),
                  list[index].productoldprice.toString(),
                  list[index].productdiscount,
                  list[index].id.toString(),
                  context));
        } else
          return CupertinoActivityIndicator();
      },
    );
  }
}
