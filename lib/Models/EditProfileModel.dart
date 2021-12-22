class EditProfileModel {
  String? status;
  Update? update;

  EditProfileModel({this.status, this.update});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    update =
        json['update'] != null ? new Update.fromJson(json['update']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.update != null) {
      data['update'] = this.update!.toJson();
    }
    return data;
  }
}

class Update {
  int? id;
  String? fullName;
  String? phoneNumber;
  Null address;
  String? email;
  Null passResetToken;
  String? verifyToken;
  int? mypoint;
  String? image;
  Null provider;
  Null providerId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Update(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.address,
      this.email,
      this.passResetToken,
      this.verifyToken,
      this.mypoint,
      this.image,
      this.provider,
      this.providerId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Update.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    email = json['email'];
    passResetToken = json['passResetToken'];
    verifyToken = json['verifyToken'];
    mypoint = json['mypoint'];
    image = json['image'];
    provider = json['provider'];
    providerId = json['provider_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['passResetToken'] = this.passResetToken;
    data['verifyToken'] = this.verifyToken;
    data['mypoint'] = this.mypoint;
    data['image'] = this.image;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
