class ConfirmOrderModel {
  String? status;
  Order? order;

  ConfirmOrderModel({this.status, this.order});

  ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? customerId;
  int? ordertrack;
  String? cshippingfee;
  int? shippingId;
  String? cdiscount;
  String? additionalshipping;
  int? orderTotal;
  String? offertype;
  String? totalproductpoint;
  String? usemypoint;
  String? orderSubtotal;
  int? orderStatus;
  String? createdAt;
  String? updatedAt;
  int? id;

  Order(
      {this.customerId,
      this.ordertrack,
      this.cshippingfee,
      this.shippingId,
      this.cdiscount,
      this.additionalshipping,
      this.orderTotal,
      this.offertype,
      this.totalproductpoint,
      this.usemypoint,
      this.orderSubtotal,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    ordertrack = json['ordertrack'];
    cshippingfee = json['cshippingfee'];
    shippingId = json['shippingId'];
    cdiscount = json['cdiscount'];
    additionalshipping = json['additionalshipping'];
    orderTotal = json['orderTotal'];
    offertype = json['offertype'];
    totalproductpoint = json['totalproductpoint'];
    usemypoint = json['usemypoint'];
    orderSubtotal = json['orderSubtotal'];
    orderStatus = json['orderStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['ordertrack'] = this.ordertrack;
    data['cshippingfee'] = this.cshippingfee;
    data['shippingId'] = this.shippingId;
    data['cdiscount'] = this.cdiscount;
    data['additionalshipping'] = this.additionalshipping;
    data['orderTotal'] = this.orderTotal;
    data['offertype'] = this.offertype;
    data['totalproductpoint'] = this.totalproductpoint;
    data['usemypoint'] = this.usemypoint;
    data['orderSubtotal'] = this.orderSubtotal;
    data['orderStatus'] = this.orderStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
