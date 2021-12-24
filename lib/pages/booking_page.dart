import 'package:flutter/material.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/models/cart.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/utils/routes.dart';
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
        backgroundColor: Colors.red,
        title: "My Bookings".text.color(Colors.white).make(),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m8,
         child: Column(
           children: [
               if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                // ignore: prefer_const_constructors
               Text("Ooppppsss, No bookings here !!!",textScaleFactor: 1.5,).centered().p64()
              else
                CircularProgressIndicator().centered().expand(),
           ],
         )
        ),
      ),
    );
  }
}


