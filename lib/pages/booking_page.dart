import 'package:NearMe/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/core/store.dart';
import 'package:NearMe/models/cart.dart';
import 'package:NearMe/models/catelog.dart';
import 'package:NearMe/utils/routes.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class Booking_page extends StatefulWidget {
  const Booking_page({Key? key}) : super(key: key);

  @override
  State<Booking_page> createState() => _Booking_pageState();
}

class _Booking_pageState extends State<Booking_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyTheme.redtheme,
        title: "My Bookings".text.color(Colors.white).make(),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m8,
         child: Column(
           children: [
               if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                // ignore: prefer_const_constructors
              SizedBox(
                height: 600,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(child: Image.asset("assets/images/house2.gif", height: 800, width: 800)),
                ),
              )
              else
                CircularProgressIndicator().centered().expand(),
           ],
         )
        ),
      ),
    );
  }
}


