import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/features/campaigns/anotherCampaignController.dart';
import 'package:muglimart_quicktech/features/campaigns/AnotherCampaignModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  // var campaigncontroller = CampaignController();
  AnotherCampaignsModel? model;

  getdata() {
    AnotherCampaignController().getcampaigns().then((value) => {
          setState(() {
            model = value;
          })
        });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Column(
            children: [
              FutureBuilder<AnotherCampaignsModel>(
                  future: getSliders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.campaigns!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              height: size.height * 20,
                              // color: Colors.red,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  baseUrl +
                                      snapshot.data!.campaigns![index].image
                                          .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );

                            // Center(
                            //     child: Text(snapshot.data!.sliders![index].image
                            //         .toString()));
                          });
                    } else {
                      return Text("Loading.....");
                    }
                  }),
            ],
          ),
        ),
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
