import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Controllers/campaignController.dart';
import 'package:muglimart_quicktech/Models/CampaignModel.dart';

class campaign_boilerplate extends StatefulWidget {
  const campaign_boilerplate({Key? key}) : super(key: key);

  @override
  _campaign_boilerplateState createState() => _campaign_boilerplateState();
}

class _campaign_boilerplateState extends State<campaign_boilerplate> {
  CampaignModel model = CampaignModel();

  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: model.campaigns!.length,
          itemBuilder: (context, i) {
            return Container(
              child: Image.network(model.campaigns![i].image.toString()),
            );
          }),
    );
  }

  getdata() {
    CampaignController().getcampaigns().then((value) => {
          model = value,
        });
  }
}
