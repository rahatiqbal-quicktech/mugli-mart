import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/features/order/ConfirmOrderModel.dart';
import 'package:muglimart_quicktech/features/order/ordersuccessscreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/main.dart';

import '../edit_profile/editprofile_textfield.dart';
import 'package:http/http.dart' as http;

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    //
    TextEditingController houseaddressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController couponController = TextEditingController();
    Size size = MediaQuery.of(context).size / 100;
    //
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              whitespace(context, 3.5, 0),
              Text(
                "Set Order Details",
                style: GoogleFonts.openSans(
                  color: basiccolor,
                  fontSize: 26,
                ),
              ),
              whitespace(context, 2, 0),
              EditProfileTextfield(
                basiccolor: basiccolor,
                controller: phoneController,
                hinttext: "Enter Phone Number",
                icon: Ionicons.call_outline,
                inputType: TextInputType.text,
              ),
              whitespace(context, 2, 0),
              EditProfileTextfield(
                basiccolor: basiccolor,
                controller: houseaddressController,
                hinttext: "House Address",
                icon: Ionicons.home_outline,
                inputType: TextInputType.text,
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
                  controller: addressController,
                  keyboardType: TextInputType.multiline,
                  minLines: 2, //Normal textInputField will be displayed
                  maxLines: 5, // when user presses enter it will adapt to it
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Ionicons.location_outline,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.8),
                      ),
                      hintText: "Full Address"),
                ),
              ),
              whitespace(context, 2, 0),
              EditProfileTextfield(
                basiccolor: basiccolor,
                controller: couponController,
                hinttext: "Enter Coupon",
                icon: Ionicons.color_wand_sharp,
                inputType: TextInputType.text,
              ),
              whitespace(context, 2, 0),
              Text(
                "*Payment method is currently set as Cash On Delivery",
                style: GoogleFonts.openSans(
                  color: Colors.grey.shade800,
                ),
              ),
              whitespace(context, 3.5, 0),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                      primary: LogoColor,
                      backgroundColor: LogoColor,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      confirmorder_fresh();
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     style: ButtonStyle(
              //         padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              //     onPressed: () {
              //       print("This is a list " + WishList.toString());
              //     },
              //     child: Text(
              //       "print list",
              //       style: TextStyle(color: basiccolor, fontSize: 23),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> WishList = [
    {
      "product_id": 1,
      "product_name": "japani silk sharee - deep jam",
      "sellerid": 1,
      "product_price": 1199,
      "quantity": 1,
      "product_size": "XL",
      "product_color": "Red"
    },
    {
      "product_id": 2,
      "product_name": "jhum tower sarees for women blue tanjin tisha",
      "sellerid": 1,
      "product_price": 1099,
      "quantity": 1,
      "product_size": "M",
      "product_color": "White"
    }
  ];
  @override
  void initState() {
    print(WishList.toList());
    super.initState();
    // fetchwishlist();
  }

  // fetchwishlist() async {
  //   List<Map<String, dynamic>> list = await sqlHelper.fetchProducts();
  //   setState(() {
  //     WishList = list;
  //   });
  // }

  final ForToken = GetStorage();

  Future confirmorder(
      String number, String house, String fulladd, String coup) async {
    Map data = {
      'cart': [
        {
          'product_id': 1,
          'product_name': "japani silk sharee - deep jam",
          'sellerid': 1,
          'product_price': 1199,
          'quantity': 1,
          'product_size': "XL",
          'product_color': "Red"
        },
        {
          'product_id': 2,
          'product_name': "jhum tower sarees for women blue tanjin tisha",
          'sellerid': 1,
          'product_price': 1099,
          'quantity': 1,
          'product_size': "M",
          'product_color': "White"
        }
      ],
      'name': 'Md. Zadu Mia',
      'phone': '01742892725',
      'district': "1",
      'area': "5",
      'stateaddress': "Road, 4/a",
      'houseaddress': "Mirpur, Dhaka",
      'fulladdress': "Mirpur, Dhaka",
      'zipcode': "1212",
      'totalprice': "1550",
      'shippingfee': "80",
      'discount': "50",
      'additionalshipping': "50",
      'couponcode': "mugilimartbijoy",
      'totalproductpoint': "20",
      'usemypoint': "20",
      'paymentType': "cod"
    };
    Map anotherdata = {
      "cart": [
        {
          "product_id": 1,
          "product_name": "japani silk sharee - deep jam",
          "sellerid": 1,
          "product_price": 1199,
          "quantity": 1,
          "product_size": "XL",
          "product_color": "Red"
        },
        {
          "product_id": 2,
          "product_name": "jhum tower sarees for women blue tanjin tisha",
          "sellerid": 1,
          "product_price": 1099,
          "quantity": 1,
          "product_size": "M",
          "product_color": "White"
        }
      ],
      "name": "Md. Zadu Mia",
      "phone": "01742892725",
      "district": "1",
      "area": "5",
      "stateaddress": "Road, 4/a",
      "houseaddress": "Mirpur, Dhaka",
      "fulladdress": "Mirpur, Dhaka",
      "zipcode": "1212",
      "totalprice": "1550",
      "shippingfee": "80",
      "discount": "50",
      "additionalshipping": "50",
      "couponcode": "mugilimartbijoy",
      "totalproductpoint": "20",
      "usemypoint": "20",
      "paymentType": "cod"
    };
    dynamic token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQwMjMxNzQ5LCJleHAiOjE2NDAyMzUzNDksIm5iZiI6MTY0MDIzMTc0OSwianRpIjoicm9DbFdaVEdaSG82QktHRiIsInN1YiI6NSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.sNiwdu0iWz12ojfQa3Opvgnw8NiXOvE5LxtFOb2KPR8";
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/order/save"),
          body: jsonEncode(anotherdata),
          //     {
          //   'cart': [
          //     {
          //       'product_id': 1,
          //       'product_name': "japani silk sharee - deep jam",
          //       'sellerid': 1,
          //       'product_price': 1199,
          //       'quantity': 1,
          //       'product_size': "XL",
          //       'product_color': "Red"
          //     },this i sthe processed data, add single cotation later
          //     {
          //       'product_id': 2,
          //       'product_name': "jhum tower sarees for women blue tanjin tisha",
          //       'sellerid': 1,
          //       'product_price': 1099,
          //       'quantity': 1,
          //       'product_size': "M",
          //       'product_color': "White"
          //     }
          //   ],
          //   'name': "Rahat iqbal",
          //   'phone': number,
          //   'district': ' ',
          //   'area': ' ',
          //   'stateaddress': ' ',
          //   'houseaddress': house,
          //   'fulladdress': fulladd,
          //   'zipcode': "1212",
          //   'totalprice': "1550",
          //   'shippingfee': "80",
          //   'discount': "50",
          //   'additionalshipping': "50",
          //   'couponcode': coup,
          //   'totalproductpoint': "20",
          //   'usemypoint': "20",
          //   'paymentType': "cod"
          // },
          headers: {
            'Accept': "application/json",
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQwMjMxNzQ5LCJleHAiOjE2NDAyMzUzNDksIm5iZiI6MTY0MDIzMTc0OSwianRpIjoicm9DbFdaVEdaSG82QktHRiIsInN1YiI6NSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.sNiwdu0iWz12ojfQa3Opvgnw8NiXOvE5LxtFOb2KPR8',
          });
      log(response.body.toString());
      print(response.statusCode);

      var JsonData = json.decode(response.body);
      log(response.toString());

      ConfirmOrderModel confirmOrderModel =
          ConfirmOrderModel.fromJson(JsonData);

      if (confirmOrderModel.status == "success") {
        log(response.toString());
        print(confirmOrderModel.status.toString());
        print(confirmOrderModel.order!.ordertrack.toString());

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      } else {
        print(response.statusCode);
        print("Not working ");
      }
    } catch (e) {
      print(e);
    }
  }

  Future confirmorder_fresh() async {
    dynamic token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQwMjQ4MTUwLCJleHAiOjE2NDAyNTE3NTAsIm5iZiI6MTY0MDI0ODE1MCwianRpIjoiNTZDOWxENlgwckZZdDBqNyIsInN1YiI6NSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.OQI46tffvp6FTlTPM-QibZsDIXmnYHdmi_KjbxkTFO4";
    try {
      http.Response response = await http
          .post(Uri.parse("https://muglimart.com/api/v1/customer/order/save"),
              body: jsonEncode({
                "cart": WishList,
                'name': "Md. Zadu Mia",
                "phone": "01742892725",
                "district": "1",
                "area": "5",
                "stateaddress": "Road, 4/a",
                "houseaddress": "Mirpur, Dhaka",
                "fulladdress": "Mirpur, Dhaka",
                "zipcode": "1212",
                "totalprice": "1550",
                "shippingfee": "80",
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
            'Authorization': 'Bearer ${token}',
          });
      log(response.body.toString());
      print(response.statusCode);

      var JsonData = json.decode(response.body);
      log(response.toString());

      ConfirmOrderModel confirmOrderModel =
          ConfirmOrderModel.fromJson(JsonData);

      if (confirmOrderModel.status == "success") {
        log(response.toString());
        print(confirmOrderModel.status.toString());
        print(confirmOrderModel.order!.ordertrack.toString());
        Get.offAll(OrderSuccessScreen(
            OrderTrackId: confirmOrderModel.order!.ordertrack.toString()));
      } else {
        print(response.statusCode);
        print("Not working ");
      }
    } catch (e) {
      print(e);
    }
  }
}
