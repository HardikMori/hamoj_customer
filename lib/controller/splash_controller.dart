import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/main.dart';
import 'package:hamoj/model/login_data_storage_model.dart';
import 'package:hamoj/utils/app_contants.dart';
import 'package:hamoj/view/login_screen.dart';
import 'package:hamoj/view/main_screen.dart';

class SplashController extends GetxController {
  var prefData = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  routing() {
    // Read the stored login data (JSON string)
    final storedDataJson = prefData.read(AppConstants.loginDatakey);

    if (storedDataJson != null) {
      // Deserialize the JSON string into the model
      Map<String, dynamic> storedDataMap = jsonDecode(storedDataJson);

      // dynamic storedDataMap = jsonDecode(storedDataJson);
      LoginDataStorageModel storedData = LoginDataStorageModel.fromJson(storedDataMap);

      // Access the password
      print('==================>>> $storedDataJson');
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(MainScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const LoginScreen());
      });
    }
  }

}
