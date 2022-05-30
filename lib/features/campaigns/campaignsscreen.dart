import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';
import 'package:muglimart_quicktech/features/campaign_products/campaign_products_screen.dart';
import 'package:muglimart_quicktech/features/campaigns/anotherCampaignController.dart';
import 'package:muglimart_quicktech/features/campaigns/AnotherCampaignModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/campaigns/controller/campaigns_controller.dart';
import 'package:muglimart_quicktech/features/campaigns/model/campaigns_model.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  // var campaigncontroller = CampaignController();
  AnotherCampaignsModel? model;

  var campaignsController = Get.put(CampaignsController());

  getdata() {
    AnotherCampaignController().getcampaigns().then((value) => {
          setState(() {
            model = value;
          })
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    campaignsController.getCampaigns();
  }

  // void initState() {
  //   getdata();

  //   Timer.periodic(Duration(seconds: 5), (_) => getdata());

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://muglimart.com/";
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      bottomNavigationBar: const TheBottomNavBar(),
      body: ListView(
        // shrinkWrap: true,
        // primary: false,
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        children: [
          whitespace(context, 1, 0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Campaigns",
              style: GoogleFonts.openSans(fontSize: 17),
            ),
          ),
          whitespace(context, 2, 0),
          Obx(() {
            if (campaignsController.campaignsList.length != 0) {
              return ListView.builder(
                  // physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount:
                      campaignsController.campaigns.value.campaigns?.length,
                  itemBuilder: (context, index) {
                    // final temp = campaignsController
                    //     .campaigns.value.campaigns?[index];
                    List<Campaign> temp = campaignsController.campaignsList;
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => CampaignProductsScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 5, 8, 15),
                        // height: size.height * 20,
                        // color: Colors.red,
                        // width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl: baseUrl + "${temp[index].image}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    LinearProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          // Image.network(
                          //     // baseUrl + temp!.image.toString(),
                          //     baseUrl + "${temp[index].image}"

                          //     // fit: BoxFit.cover,
                          //     ),
                        ),
                      ),
                    );

                    // Center(
                    //     child: Text(snapshot.data!.sliders![index].image
                    //         .toString()));
                  });
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }

  Future<AnotherCampaignsModel> getSliders() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/campaigns'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return AnotherCampaignsModel.fromJson(data);
    } else {
      return AnotherCampaignsModel.fromJson(data);
    }
  }
}
