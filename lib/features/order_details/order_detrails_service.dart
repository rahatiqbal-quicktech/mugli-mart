import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/loading_dialog/loading_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/features/order_details/order_details_model.dart';

class OrderDetailsService {
  Future<OrderDetailsModel> getOrderDetails(
      {required String token, int? primaryId}) async {
    String url = baseUrl + "/api/v1/customer/order/invoice/$primaryId";
    final response = await http.get(Uri.parse(url),
        //
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjUyMzQ1NTAxLCJleHAiOjE2NTM4NTc1MDEsIm5iZiI6MTY1MjM0NTUwMSwianRpIjoiTVBmRGs3RFF0RW9hcE1tRiIsInN1YiI6MTk1LCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.Ufdm9S_TzC9BILMLa1HDCxScfOtFvE9nAd7Sg3Cz6dQ',
        });
    print(response.body);

    // var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      LoadingDialog().dismiss();
      return orderDetailsModelFromJson(response.body);
    } else {
      LoadingDialog().dismiss();
      return orderDetailsModelFromJson(response.body);
    }
  }
}
