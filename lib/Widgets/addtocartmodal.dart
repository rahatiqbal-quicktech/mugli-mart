import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

addtocartmodal(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // elevation: 50,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      context: context,
      builder: (context) {
        return Wrap(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                whitespace(context, 2, 0),
                Text(
                  "Logo Play Cropped Hoodie",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                whitespace(context, 1.1, 0),
                Text("Price 1500 taka"),
                whitespace(context, 1.1, 0),
                Text(
                  "Total 1500 tk",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  )),
                ),
                whitespace(context, 5, 0),
                Text("Quantity"),
                whitespace(context, 5, 0),
                Text("Size"),
              ],
            ),
          ),
        ]);
      });
}
