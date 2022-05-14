import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/recommended_prdoucts/recommended_products_model.dart';

class RecommendedProductsService {
  String endPoint = "/api/v1/all-product";
  fetchRecommendedProducts() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl" + "$endPoint"));
      if (response.statusCode == 200) {
        return recommendedProductsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("fetchRecommendedProducts");
      print(e);
    }
  }
}
