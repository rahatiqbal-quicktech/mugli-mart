import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

productmodal(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      // elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      context: context,
      builder: (context) {
        return Wrap(children: [
          Column(
            children: [
              ListTile(
                title: const Text("Show Details"),
                leading: const Icon(Ionicons.newspaper),
                onTap: () {
                  Navigator.pushNamed(context, 'UnderConstructionScreen');
                },
              ),
              ListTile(
                title: const Text("Remove from cart"),
                leading: const Icon(Ionicons.trash),
                onTap: () {
                  Navigator.pushNamed(context, 'ProfileScreen');
                },
              ),
              ListTile(
                title: const Text("Report"),
                leading: const Icon(Ionicons.alert_circle),
                onTap: () {
                  Navigator.pushNamed(context, 'UnderConstructionScreen');
                },
              ),
            ],
          ),
        ]);
      });
}
