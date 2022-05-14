import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/features/profile/profilescreen.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class OrderSuccessScreen extends StatefulWidget {
  // const OrderSuccessScreen({Key? key}) : super(key: key);
  String? OrderTrackId;
  OrderSuccessScreen({required this.OrderTrackId});

  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      "https://cdn.dribbble.com/users/778626/screenshots/5064153/verify.gif"),
                ),
                whitespace(context, 2, 0),
                Text(
                  "Your Order has been successfully placed.\nYour order id -",
                  style: GoogleFonts.openSans(),
                ),
                whitespace(context, 2, 0),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 8.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade600,
                  ),
                  child: Text(
                    widget.OrderTrackId.toString(),
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 20,
                        letterSpacing: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
