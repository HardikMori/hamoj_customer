
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hamoj/api_constants/api_constants.dart';
import 'package:hamoj/api_service/service.dart';
import 'package:hamoj/utils/common_msg_utils.dart';

class DashBoardController extends GetxController {
  var box = GetStorage();

  final RestRequestProvider _apiService = RestRequestProvider();
  final Rx<RequestStatus> requestStatus = RequestStatus.none.obs;
  var prefData = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dashBoardApiCall();
  }
  Future<void> dashBoardApiCall({var body}) async {
    try {
      await _apiService.doGet(
        requestStatus: requestStatus,
        endPoint: ApiConstants.dashboard,
        onSuccess: (responseData) async {},
        onError: (errors, statusCode) {

          // Utils.getCommonErrorSnackBar('Unknown error occurred',
          //     topPadding: 40);

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
