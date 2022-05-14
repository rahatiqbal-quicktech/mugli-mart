import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/main.dart';

TextEditingController addproductcontroller = TextEditingController();
// int abc = 10;

class AddProductDialogue extends StatefulWidget {
  String name;
  int? price;
  String image;
  String pid;

  AddProductDialogue(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.pid})
      : super(key: key);

  @override
  _AddProductDialogueState createState() => _AddProductDialogueState();
}

class _AddProductDialogueState extends State<AddProductDialogue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addproductcontroller.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      content: Container(
        // alignment: Alignment.center,
        // height: (MediaQuery.of(context).size.height / 100) * 45,
        // width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add This Product',
              style: GoogleFonts.openSans(),
            ),
            Divider(
              thickness: 2,
            ),
            whitespace(context, 3, 0),
            ListTile(
              leading: CircleAvatar(
                // radius: 20,
                backgroundImage: NetworkImage(widget.image),
              ),
              title: Text(
                widget.name,
                style: GoogleFonts.openSans(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              subtitle: widget.price == 0
                  ? Text("Price not available")
                  : Text(
                      "Price : " + widget.price.toString(),
                      style: GoogleFonts.openSans(),
                    ),
            ),
            TextField(
              controller: addproductcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text(
                "Set Quantity Here",
                style: GoogleFonts.openSans(),
              )),
            ),
            // whitespace(context, 2, 0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: Icon(Ionicons.add),
                onPressed: () {
                  addToCart(
                      sentid: widget.pid,
                      sentproductname: widget.name,
                      sentproductprice: widget.price,
                      sentproductimage: widget.image,
                      sentQuantity: int.parse("${addproductcontroller.text}"));
                  Navigator.pop(context);
                  addproductcontroller.clear();
                },
                label: Text(
                  "Add Product",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        // color: Colors.black,
                        ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addToCart({
    required String? sentid,
    required String? sentproductname,
    int? sentSellerId,
    required int? sentproductprice,
    required int sentQuantity,
    String? sentProductSize,
    String? sentProductColor,
    required String? sentproductimage,
  }) async {
    String fullimageurl = "https://muglimart.com/" + sentproductimage!;
    print(sentSellerId);
    try {
      int a = await cartSql.addProduct(
          id: sentid,
          productname: sentproductname,
          sellerId: sentSellerId,
          productPrice: sentproductprice,
          productSize: sentProductSize,
          productColor: sentProductColor,
          quantitiy: sentQuantity,
          productimage: fullimageurl);

      if (a == 1) {
        print("Product Added To Cart ");
      } else if (a == 0) {
        print("Product Couldn't Be Added To Cart ");
      } else {
        print("SQL Issue for Cart");
      }
    } catch (e) {
      print(e);
    }
  }
}
