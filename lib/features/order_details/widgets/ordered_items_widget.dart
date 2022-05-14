import 'package:flutter/material.dart';
import 'package:muglimart_quicktech/features/order_details/order_details_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

class orderedItemsWidget extends StatelessWidget {
  final OrderDetailsModel? orderDetailsModel;
  final List<OrderDetail>? orderDetails;
  orderedItemsWidget({
    this.orderDetailsModel,
    this.orderDetails,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        primary: false,
        children: [
          Text(
            "Ordered Items",
            style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
          ),
          whitespace(context, 2, 0),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: orderDetails?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${orderDetails![index].productName}",
                  style: GoogleFonts.openSans(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Text(
                  "${orderDetails![index].productPrice} tk",
                  style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
          whitespace(context, 2, 0),
          Align(
            alignment: Alignment.bottomRight,
            child: Text("Total ${orderDetailsModel?.orderInfo!.orderTotal} tk",
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
