import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/features/loading_dialog/loading_dialog.dart';
import 'package:muglimart_quicktech/features/order/ConfirmOrderModel.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_area_model.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_charge_model.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_districts_model.dart';
import 'package:muglimart_quicktech/features/order/ordersuccessscreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/features/order/service/get_shipping_address_service.dart';
import 'package:muglimart_quicktech/features/order/service/save_shipping_address_service.dart';
import 'package:muglimart_quicktech/features/order/service/shipping_address_service.dart';
import 'package:muglimart_quicktech/main.dart';

import '../edit_profile/editprofile_textfield.dart';
import 'package:http/http.dart' as http;

import 'widgets/bottom_order_details_widget.dart';

class ConfirmOrderScreen extends StatefulWidget {
  String? phoneNumber;
  String? fullName;
  final double? totalPrice;
  ConfirmOrderScreen(
      {this.phoneNumber, this.fullName, this.totalPrice, Key? key})
      : super(key: key);

  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  void initState() {
    super.initState();
    setValue();
    fetchCartProducts();
    phoneController.text = widget.phoneNumber!;
    // fullNameController.text = widget.fullName!;
    ShippingAddressService().getDistricts().then((value) {
      setState(() {
        districts = value!.districts!;
        temp = false;
      });
    });
  }

  bool temp = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController additionalAddressController = TextEditingController();
  TextEditingController couponController = TextEditingController();
  TextEditingController stateAddressController = TextEditingController();
  TextEditingController houseAddressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  String? shippingDistrict = "";
  String? shippingArea = "";

  List<District> districts = [];
  List<Area>? area = <Area>[];
  District? _selectDistrict;
  Area? _selectArea;

  @override
  Widget build(BuildContext context) {
    //

    Size size = MediaQuery.of(context).size / 100;
    //
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formKey,
            child: FutureBuilder<SgippingChargeModel>(
                future: GetShippingAddressService()
                    .getData(id: authenticationToken),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (temp == true) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          whitespace(context, 3.5, 0),
                          Text(
                            "Set your address and contact.",
                            style: GoogleFonts.openSans(
                              color: basiccolor,
                              fontSize: 20,
                            ),
                          ),
                          whitespace(context, 3, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: fullNameController,
                            hinttext: "Full Name",
                            validationRequired: true,
                            validatorText:
                                "You have to provide a phone number.",
                            icon: Ionicons.person,
                            inputType: TextInputType.name,
                          ),
                          whitespace(context, 3, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: phoneController,
                            hinttext: "Enter Phone Number",
                            validationRequired: true,
                            validatorText:
                                "You have to provide a phone number.",
                            icon: Ionicons.call_outline,
                            inputType: TextInputType.phone,
                          ),
                          whitespace(context, 2, 0),
                          Container(
                            width: double.infinity,
                            // MediaQuery.of(context).size.width / 5,
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            // decoration: CustomDecoration().textFieldDecoration(),
                            child: DropdownButtonFormField<District>(
                              hint: Text(
                                "Select District",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.withOpacity(.8)),
                              ), // Not necessary for Option 1
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                              ),
                              validator: (value) =>
                                  value == null ? "Please select a zone" : null,
                              isExpanded: true,
                              value: _selectDistrict,
                              onChanged: (District? newValue) async {
                                setState(() {
                                  _selectDistrict = newValue;
                                  shippingDistrict = newValue?.name;
                                });
                                await setAreas(districtId: newValue?.id);
                              },
                              items: districts.map((District value) {
                                return DropdownMenuItem<District>(
                                  child: new Text(
                                      value.name ?? "Name not available"),
                                  value: value,
                                );
                              }).toList(),
                            ),
                          ),
                          whitespace(context, 2, 0),
                          Container(
                            width: double.infinity,
                            // MediaQuery.of(context).size.width / 5,
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            // decoration: CustomDecoration().textFieldDecoration(),
                            child: DropdownButtonFormField<Area>(
                                hint: Text(
                                  "Select Area",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.withOpacity(.8)),
                                ), // Not necessary for Option 1
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                ),
                                validator: (value) => value == null
                                    ? "Please select an area"
                                    : null,
                                isExpanded: true,
                                value: _selectArea,
                                onChanged: (Area? newValue) async {
                                  setState(() {
                                    _selectArea = newValue!;
                                    shippingArea = newValue.area;
                                  });

                                  setShippingCharge(
                                      charge: newValue?.shippingfee);
                                  setConfirmOrderTotal();
                                },
                                items: area?.map((Area value) {
                                  return DropdownMenuItem<Area>(
                                    child: new Text(
                                        value.area ?? "Name not available"),
                                    value: value,
                                  );
                                }).toList()),
                          ),
                          whitespace(context, 2, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: stateAddressController,
                            hinttext: "State Address",
                            validationRequired: false,
                            icon: Ionicons.compass,
                            inputType: TextInputType.streetAddress,
                          ),
                          whitespace(context, 1, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: houseAddressController,
                            hinttext: "House Address",
                            validationRequired: true,
                            validatorText: "House Address required",
                            icon: Ionicons.compass_outline,
                            inputType: TextInputType.streetAddress,
                          ),
                          whitespace(context, 1, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: zipCodeController,
                            hinttext: "Zip Code",
                            validationRequired: true,
                            validatorText: "Zip Code field can't be empty",
                            icon: Ionicons.code,
                            inputType: TextInputType.streetAddress,
                          ),
                          whitespace(context, 2, 0),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: basiccolor,
                                width: 0.58,
                              ),
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: additionalAddressController,
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  2, //Normal textInputField will be displayed
                              maxLines:
                                  5, // when user presses enter it will adapt to it
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'An address is required.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Ionicons.location_outline,
                                    color: basiccolor,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8),
                                  ),
                                  hintText: "Additional Address"),
                            ),
                          ),
                          whitespace(context, 2, 0),
                          EditProfileTextfield(
                            basiccolor: basiccolor,
                            controller: couponController,
                            hinttext: "Enter Coupon",
                            validationRequired: false,
                            icon: Ionicons.color_wand_sharp,
                            inputType: TextInputType.text,
                          ),
                          whitespace(context, 2, 0),
                          BottomOrderDetailsWidget(
                              shippingCharge: shippingCharge,
                              orderTotal: widget.totalPrice),
                          whitespace(context, 2, 0),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  // padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                                  primary: LogoColor,
                                  backgroundColor: LogoColor,
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    SaveShippingAddressService()
                                        .saveShippingAddress(
                                            name: fullNameController.text,
                                            phone: phoneController.text,
                                            houseAddress:
                                                houseAddressController.text,
                                            areaId: "31",
                                            districtId: "1",
                                            fullAddress: "test ",
                                            stateAddress:
                                                stateAddressController.text,
                                            zipCode: zipCodeController.text);
                                    confirmorder_fresh(
                                        name: fullNameController.text,
                                        phoneNumber: phoneController.text,
                                        address:
                                            "Test test test district test area",
                                        // address:
                                        //     "${houseAddressController.text} , ${stateAddressController.text} , ${shippingDistrict} , ${shippingArea} , ${zipCodeController.text} , ${additionalAddressController.text}",
                                        coupon: couponController.text);
                                  }
                                  // print(cartProductsList);
                                },
                                child: Text(
                                  "Confirm Order",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
                              ),
                            ),
                          ),
                          whitespace(context, 2, 0),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          whitespace(context, 2, 0),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Shipping Address : ${snapshot.data!.customer!.areaName}, ${snapshot.data!.customer!.districtName}"),
                                    whitespace(context, 1, 0),
                                    whitespace(context, 1, 0),
                                    Text(
                                      "Shipping fee : ${snapshot.data!.charge?.shippingfee}",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])),
                          whitespace(context, 2, 0),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade300),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Name : ${snapshot.data!.customer!.name}"),
                                    whitespace(context, 1, 0),
                                    Text(
                                        "Phone : ${snapshot.data!.customer!.phone}"),
                                  ])),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    temp = !temp;
                                  });
                                },
                                icon: Icon(Ionicons.pencil),
                                label: Text("Edit")),
                          ),
                          whitespace(context, 2, 0),
                          TextButton(
                              onPressed: () {
                                confirmorder_fresh(
                                    address: "Test",
                                    coupon: "test",
                                    name: "test",
                                    phoneNumber: "01779565300");
                              },
                              child: Text("Test")),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  // padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                                  primary: LogoColor,
                                  backgroundColor: LogoColor,
                                  onSurface: Colors.grey,
                                ),
                                onPressed: () {
                                  confirmorder_fresh(
                                      name: "test name",
                                      phoneNumber: "01779565300",
                                      address:
                                          "Test test test district test area",
                                      // address:
                                      //     "${houseAddressController.text} , ${stateAddressController.text} , ${shippingDistrict} , ${shippingArea} , ${zipCodeController.text} , ${additionalAddressController.text}",
                                      coupon: couponController.text);

                                  // print(cartProductsList);
                                },
                                child: Text(
                                  "Proceed",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  } else
                    return Column(
                      children: [
                        whitespace(context, 5, 0),
                        Center(child: CupertinoActivityIndicator()),
                      ],
                    );
                }),
          ),
        ),
      ),
    );
  }

  Future setAreas({int? districtId}) async {
    ShippingAreaModel? temp;
    temp = await ShippingAddressService().getArea(districtId: "$districtId");
    setState(() {
      area = temp!.areas;
    });
  }

  String? shippingCharge = "0";
  int? shippingChargeInt;
  setShippingCharge({String? charge}) {
    setState(() {
      shippingCharge = charge;
      shippingChargeInt = int.parse(shippingCharge!);
      confirmOrderTotal = (widget.totalPrice! + shippingChargeInt!);
    });
    print(shippingChargeInt);
  }

  double? confirmOrderTotal;
  setConfirmOrderTotal() {
    confirmOrderTotal = (widget.totalPrice! + shippingChargeInt!);
    print(confirmOrderTotal);
  }

  List<Map<String, dynamic>> cartProductsList = [];

  fetchCartProducts() async {
    List<Map<String, dynamic>> list = await cartSql.fetchProducts();
    setState(() {
      cartProductsList = list;
    });
    print("from fetchCartProducts - $cartProductsList");
  }

  var name;
  var authenticationToken;
  setValue() {
    final temp = GetStorage();
    setState(() {
      name = temp.read('fullName');
      authenticationToken = temp.read('token');
    });
  }

  double? subTotal;
  // double? totalPrice;

  // fetchTotalPrice() async {
  //   var temp = await cartSql.totalPrice();
  //   setState(() {
  //     totalPrice = temp;
  //     subTotal = (totalPrice! + 80)!;
  //   });
  //   print("fetchTotalPrice - subtotal  = $subTotal");
  // }

  Future confirmorder_fresh(
      {String? phoneNumber,
      String? address,
      String? coupon,
      String? name}) async {
    LoadingDialog().show(context);
    dynamic token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQ4NzA5MDkxLCJleHAiOjE2NTAyMjEwOTEsIm5iZiI6MTY0ODcwOTA5MSwianRpIjoiTVdrbnBGazh5TWdFZ29JUyIsInN1YiI6NCwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.NCYt7gKIqimVRsR5WTlQb9qWqfScl0g5DJIuF9hbwl4";

    try {
      http.Response response = await http
          .post(Uri.parse("https://muglimart.com/api/v1/customer/order/save"),
              body: jsonEncode({
                "cart": cartProductsList,
                "name": "name",
                "phone": "01779565300",
                "fulladdress": "address",
                "totalprice": "100",
                "shippingfee": "100",
                "zipcode": "12345",
                "discount": "50",
                "additionalshipping": "50",
                "couponcode": "mugilimartbijoy",
                "totalproductpoint": "20",
                "usemypoint": "20",
                "paymentType": "cod"
              }),
              headers: {
            'Accept': "application/json",
            "Content-type": "application/json",
            'Authorization': 'Bearer ${authenticationToken}',
          });
      log(response.body.toString());
      print(response.statusCode);

      var JsonData = json.decode(response.body);
      log(response.toString());

      ConfirmOrderModel confirmOrderModel =
          ConfirmOrderModel.fromJson(JsonData);

      if (confirmOrderModel.status == "success") {
        LoadingDialog().dismiss();
        log(response.toString());
        cartSql.clearCart();
        Get.off(OrderSuccessScreen(
            OrderTrackId: confirmOrderModel.order!.ordertrack.toString()));
      } else {
        LoadingDialog().dismiss();
        Get.snackbar("Something Went Wrong.", "Please try again.");
        print(response.statusCode);
        print("Not working ");
      }
    } catch (e) {
      print(e);
    }
  }
}
