import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class ShippingAdressScreen extends StatefulWidget {
  const ShippingAdressScreen({Key? key}) : super(key: key);

  @override
  _ShippingAdressScreenState createState() => _ShippingAdressScreenState();
}

class _ShippingAdressScreenState extends State<ShippingAdressScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              whitespace(context, 3, 0),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: size.height * 30,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Address",
                      style: GoogleFonts.openSans(
                          color: Colors.white70, fontSize: 15),
                    ),
                    whitespace(context, 2, 0),
                    Text(
                      "House 6, Road 137, Gulshan-1, Dhaka",
                      style: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 28),
                    ),
                  ],
                ),
              ),
              whitespace(context, 1.5, 0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
                  onPressed: () {
                    Navigator.pushNamed(context, 'ChangeAddressScreen');
                  },
                  child: Text(
                    "Change Shipping Address",
                    style: TextStyle(color: basiccolor, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
