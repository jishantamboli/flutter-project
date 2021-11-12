import 'package:flutter/material.dart';
import 'package:flutter_project1/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App",style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to 30 days of flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
