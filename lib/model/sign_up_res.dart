class SigupApiRes {
  Data? data;
  bool? status;

  SigupApiRes({this.data, this.status});

  SigupApiRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  dynamic companyName;
  int? officeNo;
  dynamic name;
  dynamic email;
  String? mobile;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic pincode;
  dynamic password;
  int? createBy;
  String? createDate;
  int? modifiedBy;
  String? modifiedDate;
  bool? isActive;
  bool? isDelete;

  Data(
      {this.id,
        this.companyName,
        this.officeNo,
        this.name,
        this.email,
        this.mobile,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.password,
        this.createBy,
        this.createDate,
        this.modifiedBy,
        this.modifiedDate,
        this.isActive,
        this.isDelete});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    officeNo = json['office_No'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    password = json['password'];
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
    data['companyName'] = companyName;
    data['office_No'] = officeNo;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['password'] = password;
    data['create_by'] = createBy;
    data['create_Date'] = createDate;
    data['modified_by'] = modifiedBy;
    data['modified_Date'] = modifiedDate;
    data['is_Active'] = isActive;
    data['is_Delete'] = isDelete;
    return data;
  }
}
