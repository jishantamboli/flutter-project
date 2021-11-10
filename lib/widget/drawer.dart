import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final ImageUrl =
      "https://i.pinimg.com/originals/61/74/f4/6174f43f82b27837c83039437a2b4fea.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            //padding: EdgeInsets.zero,
      children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Jishan Tamboli", style: TextStyle(color: Colors.white),),
              accountEmail: Text("jishantamboli2002@gmail.com",style: TextStyle(color: Colors.white),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl),
              )
            ),
          ),
          ListTile(
             leading: Icon(CupertinoIcons.home,
             color: Colors.white,
             ),
             title: Text(
               "Home",
               textScaleFactor: 1.2,
               style: TextStyle(
                 color: Colors.white,
               ),
             ),      
          ),
            ListTile(
             leading: Icon(
            CupertinoIcons.profile_circled,
             color: Colors.white,
             ),
             title: Text(
               "Profile",
               textScaleFactor: 1.2,
               style: TextStyle(
                 color: Colors.white,
                ),
             ),   
          ),
           ListTile(
             leading: Icon(CupertinoIcons.mail,
             color: Colors.white,
             ),
             title: Text(
               "E-mail me",
               textScaleFactor: 1.2,
               style: TextStyle(
                 color: Colors.white,
               ),
             ),      
          ),
       ],
      ),
    )
  );
  }
}
