import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Controllers/campaignController.dart';
import 'package:muglimart_quicktech/Models/CampaignModel.dart';
import 'package:muglimart_quicktech/Models/SliderModel.dart';
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
  CampaignModel? model;

  getdata() {
    CampaignController().getcampaigns().then((value) => {
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
              FutureBuilder<SliderModel>(
                  future: getSliders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.sliders!.length,
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
                                      snapshot.data!.sliders![index].image
                                          .toString(),
                                  //         .toString())
                                  // "https://thumbs.gfycat.com/BarrenOptimisticJapanesebeetle-size_restricted.gif",
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

              // SizedBox(
              //   height: size.height * 20,
              //   // color: Colors.red,
              //   width: double.infinity,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8.0),
              //     child: Image.network(
              //       model.campaigns![1].image.toString(),
              //       // "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2a0c5b96495497.5eaff786630f7.gif",
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // whitespace(context, 1.8, 0),
              // Container(
              //   alignment: Alignment.center,
              //   // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   height: size.height * 20,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.brown,
              //   ),
              //   child: RichText(
              //       text: TextSpan(children: <TextSpan>[
              //     TextSpan(
              //         text: "Black Friday",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: size.width * 10,
              //           fontWeight: FontWeight.w600,
              //           fontStyle: FontStyle.italic,
              //         )),
              //     TextSpan(
              //         text: "\nLimited for a few days!!!",
              //         style: TextStyle(
              //           color: Colors.white.withOpacity(0.88888),
              //           fontSize: size.width * 5,
              //           fontWeight: FontWeight.w600,
              //         )),
              //   ])),
              // ),
              // whitespace(context, 1.8, 0),
              // SizedBox(
              //   height: size.height * 20,
              //   // color: Colors.red,
              //   width: double.infinity,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8.0),
              //     child: Image.network(
              //       "https://thumbs.gfycat.com/BarrenOptimisticJapanesebeetle-size_restricted.gif",
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // whitespace(context, 1.8, 0),
              // Container(
              //   alignment: Alignment.center,
              //   // margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              //   height: size.height * 30,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: const Color(0xff6675D2),
              //   ),
              //   child: RichText(
              //       text: TextSpan(children: <TextSpan>[
              //     TextSpan(
              //         text: "50% off",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: size.width * 10,
              //           fontWeight: FontWeight.w600,
              //         )),
              //     TextSpan(
              //       text: "\non all products",
              //       style: TextStyle(
              //         color: Colors.white.withOpacity(0.88888),
              //         fontSize: size.width * 5,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ])),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<SliderModel> getSliders() async {
    final response =
        await http.get(Uri.parse('https://muglimart.com/api/v1/slider'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SliderModel.fromJson(data);
    } else {
      return SliderModel.fromJson(data);
    }
  }
}
