import 'dart:developer';

import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/campaigns/model/campaigns_model.dart';
import 'package:muglimart_quicktech/features/campaigns/service/campaigns_service.dart';

class CampaignsController extends GetxController {
  var campaignsList = <Campaign>[].obs;
  var campaigns = CampaignsModel().obs;
  getCampaigns() async {
    var temp = await CampaignsService().fetchCampaigns();
    print("Getx controller campaignList");

    if (temp != null) {
      campaignsList.value = temp.campaigns!;
      campaigns.value = temp;
      print(campaignsList);
      // log(" this is campaigns list   ${campaignsList.value}");
      // print(campaignsList.value);
    }
  }
}
