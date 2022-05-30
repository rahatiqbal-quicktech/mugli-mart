import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';
import 'package:muglimart_quicktech/features/home/another_item_card.dart';

class CampaignProductsScreen extends StatefulWidget {
  CampaignProductsScreen({Key? key}) : super(key: key);

  @override
  State<CampaignProductsScreen> createState() => _CampaignProductsScreenState();
}

class _CampaignProductsScreenState extends State<CampaignProductsScreen>
    with AllControllers {
  @override
  void initState() {
    super.initState();
    campaignProductsController.getCampaignProducts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        appBar: myappbar(context, size, Colors.white),
        bottomNavigationBar: const TheBottomNavBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              whitespace(context, 3, 0),
              Text(
                "Campaign Products",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              whitespace(context, 3, 0),
              Obx(() {
                if (campaignProductsController.campaignProducts.isNotEmpty) {
                  return SizedBox(
                    height: size.height * 85,
                    child: GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount:
                            campaignProductsController.campaignProducts.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (size.width * 1.1) / (size.height / 1.19),
                        ),
                        itemBuilder: (context, index) {
                          var tempProduct = campaignProductsController
                              .campaignProducts[index];
                          // var temp = snapshot.data!.products!.data![index];
                          return anotherItemCard(
                              size,
                              tempProduct.proImage?.image,
                              "${tempProduct.productname}",
                              "${tempProduct.productnewprice}",
                              tempProduct.productoldprice,
                              tempProduct.productdiscount,
                              "${tempProduct.id}",
                              context);
                        }),
                  );
                } else {
                  return CupertinoActivityIndicator();
                }
              }),
              whitespace(context, 30, 0),
            ],
          ),
        ));
  }
}
