import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class BottomOrderDetailsWidget extends StatelessWidget {
  const BottomOrderDetailsWidget({
    Key? key,
    required this.shippingCharge,
    required this.orderTotal,
  }) : super(key: key);

  final String? shippingCharge;
  final double? orderTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "*Payment method is currently set as Cash On Delivery",
            style: GoogleFonts.openSans(
              color: Colors.grey.shade800,
            ),
          ),
          whitespace(context, 1, 0),
          Text(
            "Sub Total: $orderTotal",
            style: GoogleFonts.openSans(),
          ),
          int.parse(shippingCharge!) != 0
              ? Text(
                  "Shipping Charge (taka) : $shippingCharge",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Text(
                  "Shipping Charge : Area Not Selected Yet",
                  style: GoogleFonts.openSans(fontStyle: FontStyle.italic),
                ),
          whitespace(context, 1, 0),
          Text(
            "Total = ${orderTotal! + int.parse(shippingCharge!)} tk",
            style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
