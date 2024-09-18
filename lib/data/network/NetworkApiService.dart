import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../response/app_axcaptions.dart';
import 'BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, Map<String, String>? headers) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Conection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(
      {required String url,
      dynamic data,
      Map<String, String>? headers}) async {
    dynamic responseJson;

    try {
      Response response = await http
          .post(Uri.parse(url), body: data,headers: headers)
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Conection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error accured while communicating with server" +
                'With status Code'  +
                response.statusCode.toString());
    }
  }
}
