import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsListtileWidget extends StatelessWidget {
  final String? tileName;
  final String? text;
  final IconData? iconData;
  const OrderDetailsListtileWidget({
    this.tileName,
    this.text,
    this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 5),
      leading: iconData != null ? Icon(iconData) : null,
      title: Text(
        "$tileName  :  $text",
        style: GoogleFonts.openSans(),
      ),
    );
  }
}
