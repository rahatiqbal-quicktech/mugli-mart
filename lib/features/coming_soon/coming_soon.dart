import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Ionicons.heart_circle_outline,
            color: Colors.grey,
            size: 50,
          ),
          whitespace(context, 3, 0),
          Text(
            "Coming Soon",
            style: GoogleFonts.openSans(
              fontSize: 21,
            ),
          ),
          whitespace(context, 3, 0),
          Text(
            "This feature is coming soon.",
            style: GoogleFonts.openSans(),
          )
        ],
      ),
    )));
  }
}
