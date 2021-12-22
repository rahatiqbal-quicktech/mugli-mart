import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Models/ConfirmOrderModel.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:muglimart_quicktech/main.dart';

import 'edit profile screen/editprofile_textfield.dart';
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
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
                  onPressed: () {
                    confirmorder(
                        phoneController.text,
                        houseaddressController.text,
                        addressController.text,
                        couponController.text);
                  },
                  child: Text(
                    "Proceed",
                    style: TextStyle(color: basiccolor, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> WishList = [];
  //
  @override
  void initState() {
    super.initState();
    fetchwishlist();
  }

  fetchwishlist() async {
    List<Map<String, dynamic>> list = await sqlHelper.fetchProducts();
    setState(() {
      WishList = list;
    });
  }

  final ForToken = GetStorage();

  Future confirmorder(
      String number, String house, String fulladd, String coup) async {
    Map data = {
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
    dynamic token = ForToken.read('LoginToken');
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/profile/update"),
          body: data,
          //
          // 'cart': WishList.toString(),
          // 'name': "",
          // 'phone': number,
          // 'district': " ",
          // 'area': " ",
          // 'stateaddress': " ",
          // 'houseaddress': house,
          // 'fulladdress': fulladd,
          // 'zipcode': "1212",
          // 'totalprice': "1550",
          // 'shippingfee': "80",
          // 'discount': "50",
          // 'additionalshipping': "50",
          // 'couponcode': coup,
          // 'totalproductpoint': "20",
          // 'usemypoint': "20",
          // 'paymentType': "cod"

          headers: {
            'Authorization': 'Bearer $token',
          });

      var JsonData = json.decode(response.body);

      ConfirmOrderModel confirmOrderModel =
          ConfirmOrderModel.fromJson(JsonData);

      if (confirmOrderModel.status == "success") {
        print(confirmOrderModel.status.toString());
        print(confirmOrderModel.order!.ordertrack.toString());

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      } else {
        print("Not working ");
      }
    } catch (e) {
      print(e);
    }
  }
}
