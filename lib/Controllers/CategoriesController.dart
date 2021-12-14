import 'dart:convert';

import 'package:muglimart_quicktech/Models/Categories.dart';
import 'package:http/http.dart' as http;

class CategoriesController {
  String rooturl = "https://muglimart.com";

  getcategories() async {
    var jsonData;
    var response = await http.get(
      Uri.parse(rooturl + "/api/v1/category"),
    );
    jsonData = json.decode(response.body);

    // List<Categories> cats = jsonData.map<Categories>((json) {
    //   return Categories.fromJson(json);
    // }).toList();
    // print(cats.toString());

    List<dynamic> categoriesList = jsonData["categories"] as List<dynamic>;

    List<Category> temp = [];
    for (var c in categoriesList) {
      Category newCat = Category.fromJson(c);
      temp.add(newCat);

      // print(temp);
      for (var a in temp) {
        print(a.catname);
      }
    }

    // static Future<List<Categories>> get() async {
    //   try {
    //     final response = await http.get(Uri.parse(rooturl));
    //     if (response.statusCode == 200) {
    //       final List<Categories> cat = categoriesFromJson(response.body);
    //       return cat;
    //     }
    //   } catch (e) {
    //     return List.empty();
    //   }
    // }
  }
}
