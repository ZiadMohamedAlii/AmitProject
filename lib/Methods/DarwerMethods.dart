import 'package:amitproject/CategoryPages/AmitCategories.dart';
import 'package:amitproject/FontsPage/Fonts.dart';
import 'package:flutter/material.dart';

import '../SignInPage.dart';

class DrawerItems extends StatelessWidget {
  IconData icon;
  String text;

  DrawerItems(
    this.icon,
    this.text,


  );

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: HomeDrawerItems,
            ),
          )
        ],
      ),
    );
  }
}
