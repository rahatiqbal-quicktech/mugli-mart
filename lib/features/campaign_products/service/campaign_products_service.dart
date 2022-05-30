import 'package:dio/dio.dart';
import 'package:muglimart_quicktech/features/campaign_products/model/campaign_products_model.dart';
import 'package:muglimart_quicktech/features/campaign_products/model/temp_campaign_products_model.dart';

class CampaignProductsService {
  String fullUrl = "https://muglimart.com/api/v1/campaigns/6";
  final dio = Dio();
  Future<TempCampaignProductsModel?> fetchCampaignProducts() async {
    try {
      var response = await dio.get(fullUrl);
      if (response.statusCode == 200) {
        return TempCampaignProductsModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
