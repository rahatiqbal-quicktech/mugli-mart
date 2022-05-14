import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/features/order_details/order_details_model.dart';
import 'package:muglimart_quicktech/features/order_details/order_detrails_service.dart';
import 'package:muglimart_quicktech/functions/get_saved_values.dart';

import 'widgets/order_details_listtile_widget.dart';
import 'widgets/ordered_items_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final token;
  final primaryId;
  const OrderDetailsScreen({this.token, this.primaryId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: myappbar(context, size, Colors.white),
      bottomNavigationBar: const TheBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: FutureBuilder<OrderDetailsModel>(
            future: OrderDetailsService().getOrderDetails(
                token: "${GetSavedValues().getToken()}", primaryId: primaryId),
            builder: (context, snapshot) {
              final temp = snapshot.data;
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: false,
                  children: [
                    whitespace(context, 2, 0),
                    Text(
                      "Order track id #${snapshot.data?.orderInfo!.ordertrack}",
                      style: GoogleFonts.openSans(fontSize: 14),
                    ),
                    whitespace(context, 1, 0),
                    orderedItemsWidget(
                      orderDetailsModel: snapshot.data,
                      orderDetails: temp?.orderDetails,
                    ),
                    whitespace(context, 2, 0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade200,
                      ),
                      child: OrderDetailsListtileWidget(
                          tileName: "Order Status",
                          text: "${temp?.orderInfo!.orderStatus}"),
                    ),
                    whitespace(context, 2, 0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade300,
                      ),
                      child: OrderDetailsListtileWidget(
                        tileName: "Name",
                        text: "${temp?.customerInfo!.fullName}",
                        iconData: Ionicons.grid_outline,
                      ),
                    ),
                    whitespace(context, 1, 0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade300,
                      ),
                      child: OrderDetailsListtileWidget(
                        tileName: "Phone Number",
                        text: "${temp?.customerInfo!.phoneNumber}",
                        iconData: Ionicons.call,
                      ),
                    ),
                  ],
                );
              } else
                return Center(child: CupertinoActivityIndicator());
            }),
      ),
    );
  }
}
