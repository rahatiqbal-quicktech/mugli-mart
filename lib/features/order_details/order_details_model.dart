// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    this.orderInfo,
    this.customerInfo,
    this.paymentmethod,
    this.shippingInfo,
    this.orderDetails,
  });

  OrderInfo? orderInfo;
  CustomerInfo? customerInfo;
  Paymentmethod? paymentmethod;
  ShippingInfo? shippingInfo;
  List<OrderDetail>? orderDetails;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        orderInfo: OrderInfo.fromJson(json["orderInfo"]),
        customerInfo: CustomerInfo.fromJson(json["customerInfo"]),
        paymentmethod: Paymentmethod.fromJson(json["paymentmethod"]),
        shippingInfo: ShippingInfo.fromJson(json["shippingInfo"]),
        orderDetails: List<OrderDetail>.from(
            json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderInfo": orderInfo!.toJson(),
        "customerInfo": customerInfo!.toJson(),
        "paymentmethod": paymentmethod!.toJson(),
        "shippingInfo": shippingInfo!.toJson(),
        "orderDetails":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class CustomerInfo {
  CustomerInfo({
    this.id,
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
    this.updatedAt,
  });

  int? id;
  String? fullName;
  String? phoneNumber;
  dynamic address;
  String? email;
  dynamic passResetToken;
  String? verifyToken;
  int? mypoint;
  String? image;
  dynamic provider;
  dynamic providerId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        id: json["id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        email: json["email"],
        passResetToken: json["passResetToken"],
        verifyToken: json["verifyToken"],
        mypoint: json["mypoint"],
        image: json["image"],
        provider: json["provider"],
        providerId: json["provider_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "address": address,
        "email": email,
        "passResetToken": passResetToken,
        "verifyToken": verifyToken,
        "mypoint": mypoint,
        "image": image,
        "provider": provider,
        "provider_id": providerId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class OrderDetail {
  OrderDetail({
    this.orderDetails,
    this.orderId,
    this.productId,
    this.sellerid,
    this.productName,
    this.productSize,
    this.productColor,
    this.productPrice,
    this.sellerCommision,
    this.productQuantity,
    this.createdAt,
    this.updatedAt,
  });

  int? orderDetails;
  int? orderId;
  int? productId;
  int? sellerid;
  String? productName;
  String? productSize;
  String? productColor;
  int? productPrice;
  int? sellerCommision;
  int? productQuantity;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderDetails: json["orderDetails"],
        orderId: json["orderId"],
        productId: json["ProductId"],
        sellerid: json["sellerid"],
        productName: json["productName"],
        productSize: json["productSize"],
        productColor: json["productColor"],
        productPrice: json["productPrice"],
        sellerCommision: json["sellerCommision"],
        productQuantity: json["productQuantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "orderDetails": orderDetails,
        "orderId": orderId,
        "ProductId": productId,
        "sellerid": sellerid,
        "productName": productName,
        "productSize": productSize,
        "productColor": productColor,
        "productPrice": productPrice,
        "sellerCommision": sellerCommision,
        "productQuantity": productQuantity,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class OrderInfo {
  OrderInfo({
    this.orderIdPrimary,
    this.customerId,
    this.ordertrack,
    this.orderTotal,
    this.cshippingfee,
    this.cdiscount,
    this.offertype,
    this.additionalshipping,
    this.shippingId,
    this.orderSubtotal,
    this.totalproductpoint,
    this.usemypoint,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
  });

  int? orderIdPrimary;
  int? customerId;
  String? ordertrack;
  int? orderTotal;
  int? cshippingfee;
  dynamic cdiscount;
  dynamic offertype;
  int? additionalshipping;
  int? shippingId;
  int? orderSubtotal;
  dynamic totalproductpoint;
  dynamic usemypoint;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        orderIdPrimary: json["orderIdPrimary"],
        customerId: json["customerId"],
        ordertrack: json["ordertrack"],
        orderTotal: json["orderTotal"],
        cshippingfee: json["cshippingfee"],
        cdiscount: json["cdiscount"],
        offertype: json["offertype"],
        additionalshipping: json["additionalshipping"],
        shippingId: json["shippingId"],
        orderSubtotal: json["orderSubtotal"],
        totalproductpoint: json["totalproductpoint"],
        usemypoint: json["usemypoint"],
        orderStatus: json["orderStatus"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "orderIdPrimary": orderIdPrimary,
        "customerId": customerId,
        "ordertrack": ordertrack,
        "orderTotal": orderTotal,
        "cshippingfee": cshippingfee,
        "cdiscount": cdiscount,
        "offertype": offertype,
        "additionalshipping": additionalshipping,
        "shippingId": shippingId,
        "orderSubtotal": orderSubtotal,
        "totalproductpoint": totalproductpoint,
        "usemypoint": usemypoint,
        "orderStatus": orderStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Paymentmethod {
  Paymentmethod({
    this.paymentIdPrimary,
    this.orderId,
    this.paymentType,
    this.cPaynumber,
    this.cPaytrxid,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  });

  int? paymentIdPrimary;
  int? orderId;
  String? paymentType;
  dynamic cPaynumber;
  dynamic cPaytrxid;
  String? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Paymentmethod.fromJson(Map<String, dynamic> json) => Paymentmethod(
        paymentIdPrimary: json["paymentIdPrimary"],
        orderId: json["orderId"],
        paymentType: json["paymentType"],
        cPaynumber: json["cPaynumber"],
        cPaytrxid: json["cPaytrxid"],
        paymentStatus: json["paymentStatus"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "paymentIdPrimary": paymentIdPrimary,
        "orderId": orderId,
        "paymentType": paymentType,
        "cPaynumber": cPaynumber,
        "cPaytrxid": cPaytrxid,
        "paymentStatus": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class ShippingInfo {
  ShippingInfo({
    this.id,
    this.name,
    this.phone,
    this.district,
    this.area,
    this.stateaddress,
    this.customerid,
    this.houseaddress,
    this.fulladdress,
    this.zipcode,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? phone;
  dynamic district;
  dynamic area;
  dynamic stateaddress;
  String? customerid;
  dynamic houseaddress;
  String? fulladdress;
  dynamic zipcode;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => ShippingInfo(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        district: json["district"],
        area: json["area"],
        stateaddress: json["stateaddress"],
        customerid: json["customerid"],
        houseaddress: json["houseaddress"],
        fulladdress: json["fulladdress"],
        zipcode: json["zipcode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "district": district,
        "area": area,
        "stateaddress": stateaddress,
        "customerid": customerid,
        "houseaddress": houseaddress,
        "fulladdress": fulladdress,
        "zipcode": zipcode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
