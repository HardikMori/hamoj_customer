class LoginDataStorageModel {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? password;

  LoginDataStorageModel(
      {this.id, this.name, this.mobileNumber, this.email, this.password});

  LoginDataStorageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
