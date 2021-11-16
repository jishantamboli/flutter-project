import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/widget/drawer.dart';
import 'package:flutter_project1/widget/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get item => null;

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)? ListView.builder(
            itemCount: CatelogModel.items.length,
            itemBuilder: (context, index) => ItemWidget(
              item: CatelogModel.items[index],
            ),
          )
          : Center(
            child: CircularProgressIndicator(),
          ),
        ),
      drawer: MyDrawer(),
    );
  }
}
