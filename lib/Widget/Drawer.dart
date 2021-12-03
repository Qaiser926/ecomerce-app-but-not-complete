import 'package:eccomerce_app/AdminScreen/addproduct.dart';
import 'package:eccomerce_app/screen/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class appDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          children: [
            Drawer_header(),
            drawer_item('Home', FontAwesomeIcons.home, () {
              Navigator.pushReplacementNamed(context, MainPage.id);
            }),
            drawer_item('Admin', FontAwesomeIcons.user, () {
              Navigator.pushReplacementNamed(context, AddProduct.id);
            }),
          ],
        ),
      ),
    );
  }

  DrawerHeader Drawer_header() {
    return DrawerHeader(
      padding: EdgeInsets.all(0),
      child: Container(
        child: Center(
            child: Text(
          'Welcome to my App',
          style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),
        )),
        color: Colors.blue,
      ),
    );
  }

  ListTile drawer_item(String title, IconData icon, GestureTapCallback ontap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: ontap,
    );
  }
}
