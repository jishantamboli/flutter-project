import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/utils/routes.dart';
import 'package:flutter_project1/widget/home_widgets/catelog_header.dart';
import 'package:flutter_project1/widget/home_widgets/catelog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");

    // final response = await http.get(Uri.parse(url));
    // final catelogJson = response.body;
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, Removemutation]);
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.black,
          ),
        ).badge(
            color: Vx.purple700,
            size: 22,
            count: _cart.items.length,
            textStyle:
                // ignore: prefer_const_constructors
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        body: SafeArea(
          child: Container(
            padding: Vx.m8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  // ignore: prefer_const_constructors
                  CatelogList().py16().expand()
                else
                  // ignore: prefer_const_constructors
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
