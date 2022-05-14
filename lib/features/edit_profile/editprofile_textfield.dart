import 'package:flutter/material.dart';

class EditProfileTextfield extends StatefulWidget {
  Color basiccolor;
  TextEditingController controller;
  String hinttext;
  bool validationRequired;
  String? validatorText;
  IconData icon;
  TextInputType inputType;
  EditProfileTextfield(
      {required this.basiccolor,
      required this.controller,
      required this.hinttext,
      required this.validationRequired,
      this.validatorText,
      required this.icon,
      required this.inputType});

  @override
  State<EditProfileTextfield> createState() => _EditProfileTextfieldState();
}

class _EditProfileTextfieldState extends State<EditProfileTextfield> {
  // EditProfileTextfield({required this.basiccolor,required this.controller,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.basiccolor,
          width: 0.58,
        ),
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        validator: (value) {
          if (widget.validationRequired) {
            if (value == null || value.isEmpty) {
              return widget.validatorText;
            }
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            border: InputBorder.none,
            prefixIcon: Icon(
              widget.icon,
              color: widget.basiccolor,
            ),
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
            hintText: widget.hinttext),
      ),
    );
  }
}
