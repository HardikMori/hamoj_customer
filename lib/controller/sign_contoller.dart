import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/api_constants/api_constants.dart';
import 'package:hamoj/api_service/service.dart';
import 'package:hamoj/model/sign_up_res.dart';
import 'package:hamoj/utils/common_msg_utils.dart';
import 'package:hamoj/view/login_screen.dart';

class SignInController extends GetxController {
  TextEditingController officeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var box = GetStorage();

  final RestRequestProvider _apiService = RestRequestProvider();
  final Rx<RequestStatus> requestStatus = RequestStatus.none.obs;
  SigupApiRes? sigupApiRes;
  var prefData = GetStorage();

  Future<void> SiginApiCall({var body}) async {
    try {
      await _apiService.doPost(
        requestStatus: requestStatus,
        endPoint: ApiConstants.registerCustomer,
        requestData: body,
        onSuccess: (responseData) async {
          sigupApiRes = SigupApiRes.fromJson(responseData);
          // if (sigupApiRes?.status ?? false) {
            Utils.getCommonSuccessSnackBar("Account Created Successfully",
                topPadding: 40);
            mobileController.clear();
            nameController.clear();
            officeController.clear();
            passwordController.clear();
            Get.offAll(LoginScreen());


            // prefData.write('login_data', loginApiRes?.data?.password);

          // } else {
          //   Utils.getCommonErrorSnackBar(
          //       loginApiRes?.message.toString() ?? "User not found",
          //       topPadding: 40);
          // }
        },
        onError: (errors, statusCode) {
          // if (statusCode == 401) {
          Utils.getCommonErrorSnackBar(errors.toString(), topPadding: 40);
          // Get.offAllNamed(RouteName.login);

          // }
        },
        onConnectionError: (errors) {
          Utils.getCommonErrorSnackBar(
            errors.first.message.toString(),
            topPadding: 40,
          );
        },
      );
    } catch (e) {}
  }

}
