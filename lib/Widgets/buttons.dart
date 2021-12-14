import 'package:flutter/material.dart';

OutlinedButton outlinedButton(
    {required String label,
    required IconData? icon,
    required Color primarycolor,
    required Color bordercolor,
    required Function action}) {
  return OutlinedButton.icon(
      onPressed: () {
        action();
      },
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        primary: primarycolor,
        side: BorderSide(color: bordercolor),
      ));
}
