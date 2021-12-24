import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/pages/login_page.dart';
import 'package:flutter_project1/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  // const MyDrawer({Key? key}) : super(key: key);
  final ImageUrl =
      "https://i.pinimg.com/originals/61/74/f4/6174f43f82b27837c83039437a2b4fea.jpg";
  String name = "Jishan Tamboli";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                margin: EdgeInsets.zero,
                accountName: Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  "jishantamboli2002@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/AccountImage.jpg"),
                )),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              "Account",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.AccountRoute),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              "LogOut",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              LoginPage();
            },
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.bookmark_fill,
              color: Colors.black,
            ),
            title: Text(
              "My Bookings",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.BookingRoute),
          ),
        ],
      ),
    ));
  }
}
