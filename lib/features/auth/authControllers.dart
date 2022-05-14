import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/home/homescreen.dart';
import 'package:muglimart_quicktech/features/loading_dialog/loading_dialog.dart';

class AuthtController {
  final authStorage = GetStorage();

  void login(String phone, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/login"),
          body: {'phoneNumber': phone, 'password': password});

      if (response.statusCode == 200) {
        LoadingDialog().dismiss();
        var data = jsonDecode(response.body.toString());
        var token = data['token'];
        var id = data['customer']['id'];
        var fullName = data['customer']['fullName'];
        var phoneNumber = data['customer']['phoneNumber'];
        var address = data['customer']['address'];
        var email = data['customer']['email'];

        authStorage.write("token", token);
        authStorage.write("id", id);
        authStorage.write("fullName", fullName);
        authStorage.write("phoneNumber", phoneNumber);
        authStorage.write("address", address);
        authStorage.write("email", email);
        // print("This is the token = ${authStorage.read('token')}");

        Get.offAll(() => HomeScreen());
      } else {
        LoadingDialog().dismiss();
        print("Login Not Working");
      }
    } catch (e) {
      LoadingDialog().dismiss();
      print(e);
    }
  }

  signup(var daata) async {
    return await http.post(
        Uri.parse("https://muglimart.com/api/v1/customer/register"),
        body: daata);
  }
}
