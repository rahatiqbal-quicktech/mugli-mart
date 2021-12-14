import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BuildContext? context;
  int? index;
  IconData? icon;

  // const BottomNavBar(
  //     {Key? key})
  //     : super(key: key);
  BottomNavBar(this.context, this.icon, this.index, {Key? key})
      : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = widget.index!;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          // color: Colors.white
          color: widget.index == selectedindex
              ? Colors.black.withOpacity(0.7)
              : Colors.white,
        ),
        child: Icon(widget.icon,
            color: widget.index == selectedindex ? Colors.white : basiccolor),
      ),
    );
  }
}
