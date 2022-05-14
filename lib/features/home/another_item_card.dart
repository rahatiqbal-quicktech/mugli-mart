import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/features/product_details/productdetailsscreen.dart';

Widget anotherItemCard(var size, String? url, String productname, String price,
    String oldprice, int? discount, String idno, BuildContext context) {
  String imageUrl;
  if (url == null) {
    imageUrl =
        "https://www.google.com/search?q=image+not+available&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjC-u2Tzej2AhVykNgFHVUsCGoQ_AUoAXoECAEQAw&biw=1440&bih=799&dpr=1#imgrc=QbT7tYTYgU6-lM";
  } else {
    imageUrl = "https://muglimart.com/" + url;
  }
  return GestureDetector(
    onTap: () {
      // Get.to(ProductDetailsScreen(id: idno));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  id: idno,
                )),
      );
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                // padding: const EdgeInsets.all(3),
                color: Colors.white,
                width: double.infinity,
                height: size.height * 26,
                child: Image.network(
                  imageUrl,
                  // fit: BoxFit.cover,
                ),
              ),
              discount != null
                  ? Positioned.fill(
                      child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                            color: LogoColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "$discount %",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ))
                  : Container(),
            ],
          ),
          whitespace(context, 2, 0),
          Text(
            productname,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Text(price),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: oldprice,
                style: GoogleFonts.openSans(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 11,
                  color: Colors.grey.shade700,
                )),
            TextSpan(text: "   "),
            TextSpan(
                text: "$price ৳",
                style: GoogleFonts.openSans(
                  // fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ])),
        ],
      ),
    ),
  );
}
