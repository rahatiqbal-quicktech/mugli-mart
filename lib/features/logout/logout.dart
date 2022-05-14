import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muglimart_quicktech/features/home/homescreen.dart';

class LogOut {
  final logOutGetStorageInstance = GetStorage();

  logOut() {
    logOutGetStorageInstance.remove('token');
    logOutGetStorageInstance.remove('id');
    logOutGetStorageInstance.remove('fullName');
    logOutGetStorageInstance.remove('phoneNumber');
    logOutGetStorageInstance.remove('address');
    logOutGetStorageInstance.remove('email');
    Get.offAll(() => HomeScreen());
  }
}
