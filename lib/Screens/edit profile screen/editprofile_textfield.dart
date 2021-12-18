import 'package:flutter/material.dart';

class EditProfileTextfield extends StatelessWidget {
  Color basiccolor;
  TextEditingController controller;
  String hinttext;
  IconData icon;
  TextInputType inputType;
  EditProfileTextfield(
      {required this.basiccolor,
      required this.controller,
      required this.hinttext,
      required this.icon,
      required this.inputType});
  // EditProfileTextfield({required this.basiccolor,required this.controller,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: basiccolor,
          width: 0.58,
        ),
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: basiccolor,
            ),
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            hintText: hinttext),
      ),
    );
  }
}
