import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SaveShippingAddressService {
  Dio dio = Dio();
  saveShippingAddress(
      {String? name,
      String? phone,
      String? districtId,
      String? areaId,
      String? stateAddress,
      String? houseAddress,
      String? fullAddress,
      String? zipCode}) async {
    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "district": districtId,
      "area": areaId,
      "stateaddress": stateAddress,
      "houseaddress": houseAddress,
      "fulladdress": fullAddress,
      "zipcode": zipCode
    };

    try {
      var response = await dio.post(
          'https://muglimart.com/api/customer/address/save/195',
          data: data);
      if (response.statusCode == 200) {
        print(response.data);
        Fluttertoast.showToast(msg: "Shipping Address Updated");
      }
    } on Exception catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "API Failed to reach an end");
    }
  }
}
