class AuthModel {
  String? status;
  Registerinfo? registerinfo;

  AuthModel({this.status, this.registerinfo});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    registerinfo = json['registerinfo'] != null
        ? new Registerinfo.fromJson(json['registerinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.registerinfo != null) {
      data['registerinfo'] = this.registerinfo!.toJson();
    }
    return data;
  }
}

class Registerinfo {
  String? fullName;
  String? phoneNumber;
  Null email;
  int? verifyToken;
  String? updatedAt;
  String? createdAt;
  int? id;

  Registerinfo(
      {this.fullName,
      this.phoneNumber,
      this.email,
      this.verifyToken,
      this.updatedAt,
      this.createdAt,
      this.id});

  Registerinfo.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    verifyToken = json['verifyToken'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['verifyToken'] = this.verifyToken;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
