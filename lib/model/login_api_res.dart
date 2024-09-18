class LoginApiRes {
  Data? data;
  bool? status;
  String? message;

  LoginApiRes({this.data, this.status,this.message});

  LoginApiRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;

    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? password;
  dynamic confirmPassword;
  int? role;
  int? createBy;
  String? createDate;
  int? modifiedBy;
  String? modifiedDate;
  bool? isActive;
  bool? isDelete;

  Data(
      {this.id,
        this.name,
        this.mobileNumber,
        this.email,
        this.password,
        this.confirmPassword,
        this.role,
        this.createBy,
        this.createDate,
        this.modifiedBy,
        this.modifiedDate,
        this.isActive,
        this.isDelete});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_Password'];
    role = json['role'];
    createBy = json['create_by'];
    createDate = json['create_Date'];
    modifiedBy = json['modified_by'];
    modifiedDate = json['modified_Date'];
    isActive = json['is_Active'];
    isDelete = json['is_Delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['password'] = password;
    data['confirm_Password'] = confirmPassword;
    data['role'] = role;
    data['create_by'] = createBy;
    data['create_Date'] = createDate;
    data['modified_by'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    data['is_Active'] = isActive;
    data['is_Delete'] = isDelete;
    return data;
  }
}
