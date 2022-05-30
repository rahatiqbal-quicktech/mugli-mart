import 'package:dio/dio.dart';
import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/campaigns/model/campaigns_model.dart';

class CampaignsService {
  String endpoint = "/api/v1/campaigns";

  Future<CampaignsModel?> fetchCampaigns() async {
    String fullUrl = baseUrl + endpoint;
    final dio = Dio();
    try {
      var response = await dio.get("https://muglimart.com/api/v1/campaigns");
      // return campaignsModelFromJson(response.data);
      if (response.statusCode == 200) {
        print("response data");
        print(response.statusCode);
        print(response.data);
        return CampaignsModel.fromJson(response.data);
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }
}
