import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/api_constants/api_constants.dart';
import 'package:hamoj/api_service/service.dart';
import 'package:hamoj/model/login_api_res.dart';
import 'package:hamoj/model/login_data_storage_model.dart';
import 'package:hamoj/utils/app_contants.dart';
import 'package:hamoj/utils/common_msg_utils.dart';
import 'package:hamoj/view/main_screen.dart';

class LoginController extends GetxController {
  var box = GetStorage();

  final RestRequestProvider _apiService = RestRequestProvider();
  final Rx<RequestStatus> requestStatus = RequestStatus.none.obs;
  LoginApiRes? loginApiRes;
  var prefData = GetStorage();
  TextEditingController mobileController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  Future<void> loginApiCall({var body}) async {
    try {
      await _apiService.doPost(
        requestStatus: requestStatus,
        endPoint: ApiConstants.login,
        requestData: body,
          onSuccess: (responseData) async {
            loginApiRes = LoginApiRes.fromJson(responseData);
            if (loginApiRes?.status ?? false) {
              Utils.getCommonSuccessSnackBar("Login Successfully", topPadding: 40);
              Get.offAll(MainScreen());

              // Create a model object with the login data
              LoginDataStorageModel loginData = LoginDataStorageModel(
                id: loginApiRes?.data?.id,
                name: loginApiRes?.data?.name,
                mobileNumber: loginApiRes?.data?.mobileNumber,
                email: loginApiRes?.data?.email,
                password: loginApiRes?.data?.password,
              );

              // Store the serialized model as JSON string
              String loginDataJson = jsonEncode(loginData.toJson());
              prefData.write(AppConstants.loginDatakey, loginDataJson);
            } else {
              Utils.getCommonErrorSnackBar(
                loginApiRes?.message.toString() ?? "User not found",
                topPadding: 40,
              );
            }
          },

          onError: (errors, statusCode) {
          // if (statusCode == 401) {
          Utils.getCommonErrorSnackBar('Unknown error occurred',
              topPadding: 40);
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
