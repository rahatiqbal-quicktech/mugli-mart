import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/features/my_orders/my_order_service.dart';
import 'package:muglimart_quicktech/features/my_orders/myordersController.dart';
import 'package:muglimart_quicktech/features/my_orders/MyOrdersModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/features/order_details/order_details_model.dart';
import 'package:muglimart_quicktech/features/order_details/order_details_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  final String bearerToken;
  const MyOrdersScreen({required this.bearerToken, Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final MyOrdersController controller = Get.put(MyOrdersController());
  final box = GetStorage();
  var token;
  @override
  void initState() {
    super.initState();
    token = box.read('token');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: myappbar(context, size, Colors.white70),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              whitespace(context, 3.7, 0),
              Text(
                "All of your previous orders -",
                style: GoogleFonts.openSans(),
              ),
              whitespace(context, 2, 0),
              FutureBuilder<MyOrders>(
                future: MyOrderService().getMyOrders(token: widget.bearerToken),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var orders = snapshot.data?.customerorders;
                    return ListView.builder(
                        primary: false,
                        itemCount: orders?.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => OrderDetailsScreen(
                                    token: token,
                                    primaryId: snapshot.data
                                        ?.customerorders![index].orderIdPrimary,
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              margin: EdgeInsets.only(bottom: 10),
                              height: size.height * 15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Order Id",
                                        ),
                                        whitespace(context, 2, 0),
                                        Text(
                                          "${orders![index].ordertrack}",
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black87,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Order Total",
                                        ),
                                        whitespace(context, 2, 0),
                                        Text(
                                          "${orders[index].orderTotal}",
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black87,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Status",
                                        ),
                                        whitespace(context, 2, 0),
                                        Text(
                                          OrderStatus(
                                              "${orders[index].orderStatus}"),
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(child: CupertinoActivityIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String OrderStatus(String status) {
    if (status == "1") {
      return "Pending";
    } else {
      return "Confirmed";
    }
  }
}
