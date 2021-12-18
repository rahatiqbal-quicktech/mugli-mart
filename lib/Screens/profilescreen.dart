import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Models/Usermodel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Users usermodel = Users();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: const TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            whitespace(context, 1.5, 0),
            Center(
              child: CircleAvatar(
                radius: size.height * 8,
                backgroundImage: NetworkImage(usermodel.profileimageurl),
              ),
            ),
            whitespace(context, 2, 0),
            Text(
              usermodel.name,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size.height * 2.6,
              )),
            ),
            Text(
              usermodel.email,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: size.height * 1.8,
              )),
            ),
            whitespace(context, 3, 0),
            profilebuttons(size, Ionicons.create_outline, "Edit Profile",
                'EditProfileScreen'),
            profilebuttons(size, Ionicons.cart_outline, "My Orders",
                'UnderConstructionScreen'),
            profilebuttons(size, Ionicons.gift_outline, "My Points",
                'UnderConstructionScreen'),
            profilebuttons(size, Ionicons.boat_outline, "Shipping Address",
                'ShippingAdressScreen'),
            profilebuttons(size, Ionicons.magnet_outline, "Track Order",
                'TrackOrderScreen'),
            whitespace(context, 3, 0),
            profilebuttons(size, Ionicons.log_out_outline, "Logout",
                'UnderConstructionScreen'),
          ],
        ),
      ),
    );
  }

  Widget profilebuttons(
    Size size,
    IconData icon,
    String buttonname,
    String routename,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routename);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(size.width * 6, 11, 5, 11),
        color: Colors.white,
        child: Row(
          children: [
            Icon(icon),
            whitespace(context, 0, 3),
            Text(
              buttonname,
              style: GoogleFonts.openSans(),
            ),
            const Spacer(),
            const Icon(
              Ionicons.chevron_forward_outline,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
