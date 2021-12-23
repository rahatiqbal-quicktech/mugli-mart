import 'dart:convert';
import 'package:muglimart_quicktech/Models/AnotherCampaignModel.dart';
import 'package:http/http.dart' as http;

class AnotherCampaignController {
  Future<AnotherCampaignsModel> getcampaigns() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    final response = await http.get(
        Uri.parse('https://muglimart.com/api/v1/campaigns'),
        headers: headers);

    var data = await jsonDecode(response.body);
    // print(data.toString());

    if (response.statusCode == 200) {
      print(data);
      return AnotherCampaignsModel.fromJson(data);
    } else {
      print("Function didnt Work");
      print(response.statusCode);
      return AnotherCampaignsModel();
    }
  }
}
