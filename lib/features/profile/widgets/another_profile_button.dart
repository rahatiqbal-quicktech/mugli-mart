import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class AnotherProfileButton extends StatelessWidget {
  final Function function;
  final IconData icon;
  final String buttonName;
  final Size size;
  AnotherProfileButton(
      {required this.buttonName,
      required this.icon,
      required this.function,
      required this.size,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(size.width * 6, 11, 5, 11),
        color: Colors.white,
        child: Row(
          children: [
            Icon(icon),
            whitespace(context, 0, 3),
            Text(
              buttonName,
              style: GoogleFonts.openSans(),
            ),
            const Spacer(),
            const Icon(
              Ionicons.chevron_forward_outline,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
