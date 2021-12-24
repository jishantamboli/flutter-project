import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/pages/account_page.dart';
import 'package:flutter_project1/pages/booking_page.dart';
import 'package:flutter_project1/pages/cart_page.dart';
import 'package:flutter_project1/pages/home_page.dart';
import 'package:flutter_project1/pages/login_page.dart';
import 'package:flutter_project1/pages/signup_page.dart';
import 'package:flutter_project1/pages/spalshScreen.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:flutter_project1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.SplashRoute,
      routes: {
        "/": (context) => Splash(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
        MyRoutes.BookingRoute: (context) => Booking_page(),
        MyRoutes.AccountRoute: (context) => AccountPage(),
        MyRoutes.SignUpRoute: (context) => SignUpPage(onSignInAno: (UserCredential) {  },),
        MyRoutes.SplashRoute: (context) => AnimatedSplashScreen(
          splash: Splash(),
          duration: 100,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          nextScreen: HomePage(),
          splashIconSize: 200,
        ),
      },
    );
  }
}
