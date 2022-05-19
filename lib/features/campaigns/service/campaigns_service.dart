import 'package:dio/dio.dart';
import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/campaigns/model/campaigns_model.dart';

class CampaignsService {
  String endpoint = "/api/v1/campaigns";

  Future<CampaignsModel?> fetchCampaigns() async {
    print("campaigns checkpoint a");
    String fullUrl = baseUrl + endpoint;
    final dio = Dio();
    try {
      var response = await dio.get(fullUrl);
      if (response.statusCode == 200) {
        print("campaigns checkpoint b");

        return campaignsModelFromJson(response.data);
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }
}
