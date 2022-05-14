import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/recommended_prdoucts/recommended_products_model.dart';
import 'package:muglimart_quicktech/features/recommended_prdoucts/recommended_products_service.dart';

class RecommendedProductsController extends GetxController {
  final recommendedProductsList = RxList<Product>();

  getRecommendedProducts() async {
    var temp = await RecommendedProductsService().fetchRecommendedProducts();
    if (temp != null) {
      recommendedProductsList.value = temp.products as List<Product>;
      // recommendedProductsList.assignAll(temp);
    }
  }
}
