class CampaignModel {
  List<Campaigns>? campaigns;

  CampaignModel({this.campaigns});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    if (json['campaigns'] != null) {
      campaigns = <Campaigns>[];
      json['campaigns'].forEach((v) {
        campaigns!.add(new Campaigns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.campaigns != null) {
      data['campaigns'] = this.campaigns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Campaigns {
  int? id;
  String? title;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Campaigns(
      {this.id,
      this.title,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Campaigns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
