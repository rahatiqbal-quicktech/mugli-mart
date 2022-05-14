import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class UnderConstructionScreen extends StatefulWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  _UnderConstructionScreenState createState() =>
      _UnderConstructionScreenState();
}

class _UnderConstructionScreenState extends State<UnderConstructionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Ionicons.chevron_back_outline),
            ),
            whitespace(context, 8, 0),
            Center(
              child: Icon(
                Ionicons.heart_outline,
                size: size.height * 15,
                color: Colors.redAccent,
              ),
            ),
            whitespace(context, 5, 0),
            Center(
              child: Text("This Page is yet to be completed.",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: size.height * 2.6,
                          fontWeight: FontWeight.w500))),
            ),
            whitespace(context, 3, 0),
            Text(
              "Good things take time. Here at Quicktech, we try our best to deliver the best output possible. Works on this app is going on extensively."
              ""
              """\n\nThank you for staying with us.""",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: size.height * 1.7,
              )),
            )
          ],
        ),
      ),
    );
  }
}
