import 'package:flutter/material.dart';
import 'package:flutter_project1/pages/home_page.dart';
import 'package:flutter_project1/pages/login_page.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute:(context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
      },
    );
  }
}
