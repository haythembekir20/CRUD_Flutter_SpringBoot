

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  String navTitle ;
  NavBar(this.navTitle);
  @override



  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 157, 6, 245),
      title : Text(navTitle),
      
    );
  }
  Size get preferredSize => const Size.fromHeight(60);
}
