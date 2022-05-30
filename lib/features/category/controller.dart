import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/category/categories_model.dart';
import 'package:muglimart_quicktech/features/category/service.dart';

class AnotherCategoriesController extends GetxController {
  // var categories_ = CategoriesModel().obs;
  var categoriesList_ = <Category>[].obs;

  void fetchCategories() async {
    var temporary = await CategoriesService().getCategoryList();
    if (temporary != null) {
      // print(temporary.categories);
      categoriesList_.value = temporary.categories as List<Category>;
    }
  }
}
