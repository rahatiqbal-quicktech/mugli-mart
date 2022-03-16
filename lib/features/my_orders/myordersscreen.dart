import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/features/my_orders/myordersController.dart';
import 'package:muglimart_quicktech/features/my_orders/MyOrdersModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final MyOrdersController controller = Get.put(MyOrdersController());
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
                future: GetMyOrders(),
                builder: (context, snapshot) {
                  // if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          margin: EdgeInsets.only(bottom: 10),
                          height: size.height * 15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "Order ID",
                                    ),
                                    whitespace(context, 2, 0),
                                    Text(
                                      "123456",
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
                                      "5000 tk",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status",
                                    ),
                                    whitespace(context, 2, 0),
                                    Text(
                                      OrderStatus(0),
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
                        );
                      });
                  // } else {
                  //   return CircularProgressIndicator();
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<MyOrders> GetMyOrders() async {
    final response = await http.get(
        Uri.parse('https://muglimart.com/api/v1/customer/order'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQwNjc0NzY4LCJleHAiOjE2NDA2NzgzNjgsIm5iZiI6MTY0MDY3NDc2OCwianRpIjoibFNHaUhwdEJNaFI1RG92YSIsInN1YiI6NSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.NPHsTIA7etmmXLd12eivc7lIxTRNCHtgAZgyo3Q0QdI',
        });
    print(response.body);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return MyOrders.fromJson(data);
    } else {
      return MyOrders.fromJson(data);
    }
  }

  String OrderStatus(int status) {
    if (status == "1") {
      return "Pending";
    } else {
      return "Confirmed";
    }
  }
}
