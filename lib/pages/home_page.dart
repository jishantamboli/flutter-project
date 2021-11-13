import 'package:flutter/material.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/widget/drawer.dart';
import 'package:flutter_project1/widget/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
