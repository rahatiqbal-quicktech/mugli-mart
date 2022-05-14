import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/category_products/category_product_model.dart';

Future<CategoryProducts> getCategoryProducts(String categoryId) async {
  final response = await http.get(
      Uri.parse('https://muglimart.com/api/v1/category-products/$categoryId'));
  var data = response.body;
  if (response.statusCode == 200) {
    return categoryProductsFromJson(data);
  } else
    return CategoryProducts();
}
