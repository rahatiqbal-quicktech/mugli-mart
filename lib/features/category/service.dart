import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:muglimart_quicktech/features/category/Categories.dart';
import 'package:muglimart_quicktech/features/category/categories_model.dart';

class CategoriesService {
  Future<CategoriesModel> getCategoryList() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/category'));

    // var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoriesModelFromJson(jsonString);
    } else
      return CategoriesModel();
  }
}
