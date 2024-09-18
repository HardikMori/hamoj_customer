import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/controller/dash_board_controller.dart';
import 'package:hamoj/controller/login_controller.dart';
import 'package:hamoj/controller/sign_contoller.dart';
import 'package:hamoj/controller/splash_controller.dart';

class AppBinding extends Bindings {
  AppBinding();
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(GetStorage());
    Get.put(LoginController());
    Get.put(SplashController());
    Get.put(SignInController());
    Get.put(DashBoardController());

  }
}