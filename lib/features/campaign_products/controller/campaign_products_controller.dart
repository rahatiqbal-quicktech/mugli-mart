import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/campaign_products/model/campaign_products_model.dart';
import 'package:muglimart_quicktech/features/campaign_products/model/temp_campaign_products_model.dart';
import 'package:muglimart_quicktech/features/campaign_products/service/campaign_products_service.dart';

class CampaignProductsController extends GetxController {
  var campaignProducts = <Data>[].obs;

  getCampaignProducts() async {
    TempCampaignProductsModel? temp =
        await CampaignProductsService().fetchCampaignProducts();
    if (temp != null) {
      campaignProducts.value = temp.products?.data as List<Data>;
    }
  }
}
