import 'package:NearMe/widget/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/pages/login_page.dart';
import 'package:NearMe/utils/routes.dart';

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
                decoration: BoxDecoration(color: MyTheme.redtheme,),
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
              Icons.airline_seat_individual_suite_rounded,
              color: Colors.black,
            ),
            title: Text(
              "My Rooms",
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
           ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.black,
            ),
            title: Text(
              "Language A/a",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.BookingRoute),
          ),
           ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.black,
            ),
            title: Text(
              "Invite & earn",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.BookingRoute),
          ),
          Divider( thickness: 2,),
           ListTile(
            leading: Icon(
              Icons.privacy_tip,
              color: Colors.black,
            ),
            title: Text(
              "Privacy Policy",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.BookingRoute),
          ),
           ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
            ),
            title: Text(
              "Need Help?",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.BookingRoute),
          ),
           ListTile(
            leading: Icon(
             Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              "LogOut",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, MyRoutes.LoginRoute),
          ),
        ],
      ),
    ));
  }
}
