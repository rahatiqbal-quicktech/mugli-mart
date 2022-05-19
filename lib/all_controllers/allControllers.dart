import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/campaigns/controller/campaigns_controller.dart';
import 'package:muglimart_quicktech/features/category/controller.dart';
import 'package:muglimart_quicktech/features/home/slider/slider_controller.dart';
import 'package:muglimart_quicktech/features/recommended_prdoucts/recommended_products_controller.dart';

class AllControllers {
  final categoriesController = Get.put(AnotherCategoriesController());
  final sliderController = Get.put(SliderController());
  final recommendedProductsController =
      Get.put(RecommendedProductsController());
  final campaignsController = Get.put(CampaignsController());
}
