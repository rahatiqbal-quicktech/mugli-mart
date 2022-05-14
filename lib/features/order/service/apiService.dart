import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/main.dart';

import '../ConfirmOrderModel.dart';
import '../ordersuccessscreen.dart';

class ConfirmOrderApiService {
  ConfirmOrderApiService() {
    fetchCartProducts();
  }

  List<Map<String, dynamic>> cartProductsList = [];
  fetchCartProducts() async {
    List<Map<String, dynamic>> list = await cartSql.fetchProducts();
    cartProductsList = list;
    print("from fetchCartProducts - $cartProductsList");
  }

  clearCart() async {}

  final tempGetStorage = GetStorage();
  var name;
  var phoneNumber;
  setValues() {}

  Future confirmOrder() async {
    print("confirmOrder function  -  ");
    fetchCartProducts();
    dynamic token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQ4NzA5MDkxLCJleHAiOjE2NTAyMjEwOTEsIm5iZiI6MTY0ODcwOTA5MSwianRpIjoiTVdrbnBGazh5TWdFZ29JUyIsInN1YiI6NCwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.NCYt7gKIqimVRsR5WTlQb9qWqfScl0g5DJIuF9hbwl4";

    try {
      http.Response response = await http
          .post(Uri.parse("https://muglimart.com/api/v1/customer/order/save"),
              body: jsonEncode({
                "cart": cartProductsList,
                "name": "Md. Zadu Mia",
                "phone": "01742892725",
                "fulladdress": "Mirpur, Dhaka`",
                "totalprice": "1550",
                "shippingfee": "80",
                "usemypoint": "20",
                "paymentType": "cod"
              }),
              headers: {
            'Accept': "application/json",
            "Content-type": "application/json",
            'Authorization': 'Bearer ${token}',
          });
      log(response.body.toString());
      print(response.statusCode);

      var JsonData = json.decode(response.body);
      log(response.toString());

      ConfirmOrderModel confirmOrderModel =
          ConfirmOrderModel.fromJson(JsonData);

      if (confirmOrderModel.status == "success") {
        cartSql.clearCart();
        log(response.toString());
        print(confirmOrderModel.status.toString());
        print(confirmOrderModel.order!.ordertrack.toString());
        Get.offAll(OrderSuccessScreen(
            OrderTrackId: confirmOrderModel.order!.ordertrack.toString()));
      } else {
        print(response.statusCode);
        print("Not working ");
      }
    } catch (e) {
      print(e);
    }
  }
}
