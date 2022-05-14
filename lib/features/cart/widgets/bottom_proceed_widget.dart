import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/features/order/confirmorderscreen.dart';

class BottomProceedWidget extends StatelessWidget {
  const BottomProceedWidget(
      {Key? key,
      required this.size,
      required this.subTotal,
      required this.phoneNumber,
      required this.totalPrice,
      this.fullName})
      : super(key: key);

  final Size size;
  final double? subTotal;
  final phoneNumber;
  final fullName;
  final double? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
      height: size.height * 11.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black87,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              whitespace(context, 1.1, 0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sub Total ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  whitespace(context, 0, 2),
                  Text(
                    "$subTotal",
                    style: TextStyle(
                        decorationColor: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {
              // print(CartList);
              // CheckLogIn().checkLogIn(
              //     function: () {
              //       Get.off(() => ConfirmOrderScreen());
              //     },
              //     context: context);
              Get.to(ConfirmOrderScreen(
                phoneNumber: phoneNumber,
                totalPrice: totalPrice,
                fullName: fullName,
              ));
            },
            child: const Text('Proceed'),
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
