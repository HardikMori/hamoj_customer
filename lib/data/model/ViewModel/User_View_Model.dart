import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("userLoginToken", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("userLoginToken");

    return UserModel(
      token: token.toString(),
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("userLoginToken");
    return true;
  }

  Future<Map<String, String>?> usertoken() async {
    final UserModel user = await getUser(); // Get the user model
    final String? token = user.token; // Get the token from the user model

    // Check if the token is not null or empty
    if (token!.isNotEmpty) {
      return {
        'Authorization': token,
      };
    } else {
      return null; // Return null if token is null or empty
    }
  }
}

class BaseResponse {
  BaseResponse({
    bool? success,
    String? message,
    dynamic data,
    List<Error>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _error = error;
  }

  BaseResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'];
    if (json['errors'] != null) {
      _error = [];
      json['errors'].forEach((v) {
        _error?.add(Error.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  dynamic _data;
  List<Error>? _error;

  bool? get success => _success;

  String? get message => _message;

  dynamic get data => _data;

  List<Error>? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['data'] = _data;
    if (_error != null) {
      map['errors'] = _error?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Error {
  Error({
    String? message,
  }) {
    _message = message;
  }

  Error.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}