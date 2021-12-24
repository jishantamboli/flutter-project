import 'package:flutter/material.dart';
import 'package:flutter_project1/pages/home_page.dart';
import 'package:flutter_project1/utils/routes.dart';

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
      children: [
          Expanded(
            child: Container(
           child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,height: 200,width: 200,),
          )
          ),
          Text("NearMe", style: TextStyle(color: Colors.red,fontSize: 24, fontWeight: FontWeight.bold)),
      ],
         ),
       )
    );
  }
}
