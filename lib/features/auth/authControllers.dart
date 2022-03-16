import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/home/homescreen.dart';

class AuthtController {
  final authStorage = GetStorage();

  void login(String phone, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/login"),
          body: {'phoneNumber': phone, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['token'];

        authStorage.write("token", token);
        print("This is the token = ${authStorage.read('token')}");

        Get.off(() => HomeScreen());
      } else {
        print("Login Not Working");
      }
    } catch (e) {
      print(e);
    }
  }

  signup(var daata) async {
    return await http.post(
        Uri.parse("https://muglimart.com/api/v1/customer/register"),
        body: daata);
  }
}
