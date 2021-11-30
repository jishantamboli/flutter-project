import 'package:flutter/material.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/pages/cart_page.dart';
import 'package:flutter_project1/pages/home_page.dart';
import 'package:flutter_project1/pages/login_page.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:flutter_project1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';


void main() {
  runApp(VxState(store : MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.HomeRoute:(context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}
