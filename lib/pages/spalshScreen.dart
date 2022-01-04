import 'package:flutter/material.dart';
import 'package:NearMe/pages/home_page.dart';
import 'package:NearMe/utils/routes.dart';
import 'package:velocity_x/src/flutter/padding.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  // initstate() {
  //   initState();
  //   _navigatetohome();
  // }

  // _navigatetohome() async {
  //   await Future.delayed(Duration(seconds: 1), () {});
  //   Navigator.pushReplacementNamed(context, MyRoutes.HomeRoute);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
      children: [
          Expanded(
            child: Container(
           child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,height: 300,width: 300,),
          )
          ),
          Text("NearMe", style: TextStyle(color: Colors.red,fontSize: 24, fontWeight: FontWeight.bold))
          .py12(),
      ],
         ),
       )
    );
  }
}
