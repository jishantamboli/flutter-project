import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'dart:async';

// StreamController<List> streamController = streamController<List>();

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _FormKey = GlobalKey<FormState>();
  String? username = "Jishan Tamboli";
  String? email = "Jishantamboli2002@gmail.com";
  // String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: "Account".text.color(Colors.white).xl2.semiBold.make(),
        ),
        body: Material(
            color: Colors.white,
            child: Form(
                key: _FormKey,
                child: Column(children: [
                  //  Image.asset("assets/images/AccountImage.jpg"),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AssetImage("assets/images/AccountImage.jpg"),
                  ).py16(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: username,
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: email,
                          ),
                        ),
                        SizedBox(
                          height: 110.0,
                        ),
                        Material(
                          child: Text(
                            "NearMe",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ).p8(),
                      ],
                    ),
                  )
                ]))));
  }
}
