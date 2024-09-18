import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamoj/data/model/ViewModel/User_View_Model.dart';

/// to avoid callbacks to handle api requests.
class ResponseModel {
  late bool success;
  Map<String, dynamic>? data;
  List<Error>? error;
  ResponseModel({required this.success, this.data, this.error});
  ResponseModel.withSuccess(Map<String, dynamic> d) {
    success = true;
    data = d;
    error = null;
  }
  ResponseModel.withError(List<Error> e) {
    success = false;
    data = null;
    error = e;
  }
}

class RestRequestProvider extends GetConnect {
  @override
  void onInit() {
    print("RestRequestProvider onInit");
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 20);

    // httpClient.defaultDecoder = baseResponse.fromJson;

    // httpClient.addAuthenticator((request) async {
    //   var headers = {
    //     'APIKey': "3297F0F2-35D3-4231-919D-1CFCF4035975",
    //     'UserId': "6",
    //     'UserSessionId': "327a8c0c-b404-4435-9693-ba3a62c35eb4",
    //   };
    //   request.headers.addAll(headers);
    //   return request;
    // });
    super.onInit();
  }

  Map<String, String>? getHeader() {
    return {
      'Authorization': "",
    };
  }

  Future<ResponseModel> doGet(
      {required String endPoint,
        dynamic requestData,
        Map<String, String>? headers,
        Map<String, dynamic>? queryParams,
        required Function(Map<String, dynamic> response) onSuccess,
        required Function(List<Error> error, int statusCode) onError,
        Function(List<Error> errors)? onConnectionError,
        Rx<RequestStatus>? requestStatus,
        Duration? cacheDuration}) async {
    print("requestData $queryParams");
    try {
      String queryString = '';
      if (queryParams != null) {
        queryString = '?' + queryParams.entries.map((e) => '${e.key}=${e.value}').join('&');
      }
      String url = endPoint + queryString;

      changeRequestStatus(requestStatus, RequestStatus.loading);
      var response = await get(url, headers: headers ?? getHeader());
      print("response.statusCode ${response.statusCode}");
      print("response.statusText ${response.statusText}");
      if (response.isOk) {
        print("response.isOkk");
        var baseResponse = BaseResponse.fromJson(response.body);
        if (response.statusCode == 200) {
          onSuccess(response.body);
          log("success.request:${response.body}");
          print("endpoint $url");
          changeRequestStatus(requestStatus, RequestStatus.success);
          return ResponseModel.withSuccess(response.body);
        } else {
          print("onError");
          onError([Error(message: baseResponse.message ?? "Unknown error")],
              response.statusCode ?? 0); // Include statusCode
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }
      } else if (response.hasError) {
        print("hasError ${response.bodyString}");
        print("hasError ${response.body}");
        print("hasError ${response.status}");

        if (response.status.connectionError && onConnectionError != null) {
          onConnectionError([Error(message: "Please Check your internet connection")]);
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }

        if (response.body != null) {
          var baseResponse = BaseResponse.fromJson(response.body);
          onError([Error(message: baseResponse.message ?? "Unknown error")],
              response.statusCode ?? 0); // Include statusCode
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError(baseResponse.error ?? []);
        } else {
          onError(
              [Error(message: "Unknown error")], response.statusCode ?? 0); // Include statusCode
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError(getError(response));
        }
      }
    } catch (e) {
      print("catch error ${e.toString()}");
      List<Error> errors = [Error(message: "Exceptional Error : ${e.toString()}")];
      onError(errors, 0); // Include null as statusCode
      changeRequestStatus(requestStatus, RequestStatus.failed);
      return ResponseModel.withError(errors);
    }
    return ResponseModel.withError([]);
  }

  Future<ResponseModel> doPost({
    required String endPoint,
    Map<String, String>? headers,
    dynamic requestData,
    required Function(dynamic response) onSuccess,
    required Function(List<Error> errors, int? statusCode) onError,
    Function(List<Error> errors)? onConnectionError,
    Rx<RequestStatus>? requestStatus,
  }) async {
    print("endPoint $endPoint");
    print("requestData $requestData");

    try {
      changeRequestStatus(requestStatus, RequestStatus.loading);

      var response = await post(endPoint, requestData, headers: headers ?? getHeader());

      if (response.isOk) {
        var baseResponse = BaseResponse.fromJson(response.body);

        if (response.statusCode == 200) {
          log("success.request:${response.body}");
          onSuccess(response.body);
          changeRequestStatus(requestStatus, RequestStatus.success);
          return ResponseModel.withSuccess(response.body);
        } else {
          onError([Error(message: baseResponse.message ?? "Unknown error")], response.statusCode);
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }
      } else if (response.hasError) {
        if (response.status.connectionError && onConnectionError != null) {
          onConnectionError([Error(message: "Please Check your internet connection")]);
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }

        var baseResponse = BaseResponse.fromJson(response.body);
        if (baseResponse != null && baseResponse.message != null) {
          onError([Error(message: baseResponse.message ?? "Unknown error")], response.statusCode);
        } else {
          onError([Error(message: "Unknown error")], response.statusCode);
        }
        changeRequestStatus(requestStatus, RequestStatus.failed);
        return ResponseModel.withError(baseResponse?.error ?? []);
      }
    } catch (e) {
      print("catch error ${e.toString()}");
      List<Error> errors = [Error(message: "Exceptional Error : ${e.toString()}")];
      onError(errors, null);
      changeRequestStatus(requestStatus, RequestStatus.failed);
      return ResponseModel.withError(errors);
    }

    return ResponseModel.withError([]);
  }

  doPut(
      {required String endPoint,
        dynamic requestData,
        Map<String, String>? headers,
        required Function(Map<String, dynamic> response) onSuccess,
        required Function(List<Error> errors, int? statusCode) onError,
        Function(List<Error> errors)? onConnectionError,
        Rx<RequestStatus>? requestStatus}) async {
    print("endPoint $endPoint");
    print("requestData $requestData");
    try {
      changeRequestStatus(requestStatus, RequestStatus.loading);

      var response = await put(endPoint, requestData, headers: headers ?? getHeader());

      if (response.isOk) {
        log("response.body:${response.body}");

        var baseResponse = BaseResponse.fromJson(response.body);

        if (baseResponse.message == "success") {
          log("success.request:${response.body}");
          onSuccess(response.body);
          changeRequestStatus(requestStatus, RequestStatus.success);
          return ResponseModel.withSuccess(response.body);
        } else {
          onError([Error(message: baseResponse.message ?? "Unknown error")], response.statusCode);
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }
      } else if (response.hasError) {
        if (response.status.connectionError && onConnectionError != null) {
          onConnectionError([Error(message: "Please Check your internet connection")]);
          changeRequestStatus(requestStatus, RequestStatus.failed);
          return ResponseModel.withError([]);
        }

        var baseResponse = BaseResponse.fromJson(response.body);
        if (baseResponse != null && baseResponse.message != null) {
          onError([Error(message: baseResponse.message ?? "Unknown error")], response.statusCode);
        } else {
          onError([Error(message: "Unknown error")], response.statusCode);
        }
        changeRequestStatus(requestStatus, RequestStatus.failed);
        return ResponseModel.withError(baseResponse?.error ?? []);
      }
    } catch (e) {
      print("error ${e.toString()}");
      List<Error> errors = [];
      errors.add(Error(message: "Exceptional Error : ${e.toString()}"));
      onError(errors, null);
      changeRequestStatus(requestStatus, RequestStatus.failed);
    }
  }

  doDelete(
      {required String endPoint,
        dynamic requestData,
        required Function(Map<String, dynamic> response) onSuccess,
        required Function(List<Error> error) onError,
        Function(List<Error> error)? onConnectionError,
        Rx<RequestStatus>? requestStatus}) async {
    try {
      changeRequestStatus(requestStatus, RequestStatus.loading);
      var response = await delete(endPoint, query: requestData, headers: getHeader());
      print("requestData DELETE $requestData");
      print("requestData DELETE ${response.request?.url}");
      print("response DELETE ${response.body.toString()}");

      if (response.isOk) {
        log("response.body:${response.body}");
        var baseResponse = BaseResponse.fromJson(response.body);
        if ((baseResponse.success ?? false)) {
          /// means actual success
          onSuccess(response.body);
          changeRequestStatus(requestStatus, RequestStatus.success);
        } else {
          onError(baseResponse.error ?? []);
          changeRequestStatus(requestStatus, RequestStatus.failed);
        }
      } else if (response.hasError) {
        if (response.status.connectionError && onConnectionError != null) {
          onConnectionError([Error(message: "Please Check your internet connection")]);
        }
        onError(getError(response));
        changeRequestStatus(requestStatus, RequestStatus.failed);
      }
    } catch (e) {
      print("error ${e.toString()}");
      List<Error> errors = [];
      errors.add(Error(message: "Exceptional Error : ${e.toString()}"));
      onError(errors);
      changeRequestStatus(requestStatus, RequestStatus.failed);
    }
  }

  List<Error> getError(Response<dynamic> response) {
    List<Error> error = [];
    if (response.status.connectionError) {
      error.add(Error(message: "Please Check your internet connection"));
    } else if (response.status.isForbidden) {
      error.add(Error(message: "Forbidden"));
    } else if (response.status.isNotFound) {
      error.add(Error(message: "NotFound"));
    } else if (response.status.isServerError) {
      error.add(Error(message: "ServerError"));
    } else if (response.status.isUnauthorized) {
      error.add(Error(message: "please login to your account."));
      // AppPreferences.clearDataAndLogout();
      //
      // /// clears other db tables
      // EventsDatabaseHelper.db.clearEventsTable();
      // FeedsDatabaseHelper.db.clearFeedsTable();
      // Get.offAllNamed(RouteName.login);
    } else {
      error.add(Error(message: response.body?["message"] ?? "Unknown Error"));
    }
    return error;
  }

  void changeRequestStatus(Rx<RequestStatus>? requestStatus, RequestStatus toStatus) {
    if (requestStatus != null) {
      requestStatus.value = toStatus;
    }
  }
}

enum RequestStatus {
  loading,
  success,
  failed,
  none,
}

void changeRequestStatus(Rx<RequestStatus>? requestStatus, RequestStatus status) {
  if (requestStatus != null) {
    requestStatus.value = status;
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CupertinoActivityIndicator(
          color: AppColor.whiteColor,
          radius: 15,
          animating: true,
        ),
      );
    },
  );
}


class AppColor {
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color lablecolor = Color.fromRGBO(66, 66, 66, 1);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color DividerColor = Color.fromRGBO(217, 217, 217, 1);
  static const Color selectedbottomimage = Color.fromRGBO(180, 204, 149, 1);
  static const Color unselectedbottomimage = Color.fromRGBO(255, 255, 255, 1);
  static const Color slidingtitle = Color.fromRGBO(34, 34, 34, 1);
  static const Color dotcolor = Color.fromRGBO(155, 155, 155, 1);
  static const Color title = Color.fromRGBO(28, 42, 58, 1);
  static const Color verifyborder = Color.fromRGBO(240, 249, 255, 1);
  static const Color subtitle = Color.fromRGBO(107, 114, 128, 1);
  static const Color Hinttext = Color.fromRGBO(199, 199, 199, 1);
  static const Color BorderColor = Color.fromRGBO(209, 213, 219, 1);
  static const Color redcolor = Color.fromRGBO(213, 32, 39, 1);
  static const Color textfillcolor = Color.fromRGBO(249, 250, 251, 1);
  static const Color specialisttext = Color.fromRGBO(75, 85, 99, 1);
  static const Color ShadowColor1 = Color.fromRGBO(0, 0, 0, 0.05);
  static const Color ShadowColor2 = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color ShadowColor3 = Color.fromRGBO(0, 0, 0, 0.09);
  static const Color sucessnotification = Color.fromRGBO(222, 247, 229, 1);
  static const Color changednotification = Color.fromRGBO(243, 244, 246, 1);
  static const Color cancellednotification = Color.fromRGBO(253, 232, 232, 1);
  static const Color bottombackground = Color.fromRGBO(228, 240, 250, 1);
  static const Color indicatorcolor = Color.fromRGBO(229, 231, 235, 0.7);
  static const Color canclebuttoncolor = Color.fromRGBO(229, 231, 235, 1);
  static const Color bottombarcolor = Color.fromRGBO(246, 246, 246, 1);

  static const Color bluecolor = Color.fromRGBO(0, 118, 192, 1);
  static const Color UnselectedLable = Color.fromRGBO(156, 163, 175, 1);
  static const Color buttonColor = Color.fromRGBO(2, 64, 111, 1);
  Color buttonLiteColor = Color.fromRGBO(2, 64, 111, 0.5);

  static const Color CardColor = Color.fromRGBO(242, 242, 242, 1);
  static const Color headingColor = Color.fromRGBO(8, 37, 105, 1);
  static const Color InputdecoraterText = Color.fromRGBO(43, 46, 49, 1);
  static const Color Text = Color.fromRGBO(43, 46, 49, 1);
  static const Color UserScreenSmallText = Color.fromRGBO(130, 130, 130, 1);
  static const Color NormalText = Color.fromRGBO(43, 46, 49, 1);
  static const Color InventoryButtun = Color.fromRGBO(58, 144, 117, 1);
  static const Color bottomHome = Color.fromRGBO(171, 15, 57, 1);
  static const Color bottomSearch = Color.fromRGBO(15, 96, 171, 1);
  static const Color bottomDemands = Color.fromRGBO(171, 99, 15, 1);
  static const Color bottomconnects = Color.fromRGBO(209, 141, 9, 1);
  static const Color bottomnotification = Color.fromRGBO(15, 171, 21, 1);

  static const MaterialColor primarySwatchColor = MaterialColor(
    0xFF02406F,
    <int, Color>{
      50: Color(0xFFE1E5E8),
      100: Color(0xFFB3BEC9),
      200: Color(0xFF8094A7),
      300: Color(0xFF4D6A85),
      400: Color(0xFF264970),
      500: Color(0xFF02406F),
      600: Color(0xFF023868),
      700: Color(0xFF02305E),
      800: Color(0xFF022854),
      900: Color(0xFF021B42),
    },
  );

  static const List<Color> ColorList = [
    Color.fromRGBO(220, 148, 151, 0.8),
    Color.fromRGBO(147, 193, 158, 1),
    Color.fromRGBO(245, 173, 126, 1),
    Color.fromRGBO(172, 161, 205, 1),
    Color.fromRGBO(77, 155, 145, 0.7),
    Color.fromRGBO(122, 161, 190, 1),
    Color.fromRGBO(222, 182, 181, 1),
    Color.fromRGBO(137, 204, 219, 1),
    // Color.fromRGBO(240, 128, 128, 1),
    // Color.fromRGBO(143, 188, 143, 1),
    // Color.fromRGBO(255, 160, 122, 1),
    // Color.fromRGBO(186, 85, 211, 1),
    // Color.fromRGBO(255, 209, 204, 1),
    // Color.fromRGBO(100, 149, 237, 1),
    // Color.fromRGBO(255, 182, 193, 1),
    // Color.fromRGBO(135, 206, 235, 1),
    // Color.fromRGBO(220, 146, 92, 1),
    // Color.fromRGBO(255, 238, 144, 1),
    // Color.fromRGBO(255, 228, 181, 1),
    // Color.fromRGBO(245, 104, 238, 1),
    // Color.fromRGBO(122, 161, 170, 1),
    // Color.fromRGBO(77, 155, 225, 1),
    // Color.fromRGBO(255, 192, 203, 1),
    // Color.fromRGBO(173, 216, 230, 1),
  ];
}