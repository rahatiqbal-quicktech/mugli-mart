import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muglimart_quicktech/features/auth/loginscreen.dart';

class CheckLogIn {
  final checkAuthGetStorage = GetStorage();
  checkLogIn({required Function function, required BuildContext context}) {
    String? token;
    token = checkAuthGetStorage.read('token');
    if (token == null) {
      return logInDialog(context);
    } else {
      function();
    }
  }

  Future<void> logInDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('You are not logged in.')),
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  child: const Text('Log In'),
                  style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(() => LoginScreen());
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
