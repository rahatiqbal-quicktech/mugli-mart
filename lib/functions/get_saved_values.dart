import 'package:get_storage/get_storage.dart';

class GetSavedValues {
  final box = GetStorage();
  String? token;

  String? getToken() {
    token = box.read('token');
    return token;
  }

  int getId() {
    return box.read('id');
  }
}
