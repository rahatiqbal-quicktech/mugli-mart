import 'dart:developer';

import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/campaigns/model/campaigns_model.dart';
import 'package:muglimart_quicktech/features/campaigns/service/campaigns_service.dart';

class CampaignsController extends GetxController {
  var campaignsList = <Campaign>[].obs;
  getCampaigns() async {
    var temp = await CampaignsService().fetchCampaigns();
    if (temp != null) {
      campaignsList.value = temp.campaigns as List<Campaign>;
      log(" this is campaigns list   ${campaignsList.value}");
      print(campaignsList);
    }
  }
}
