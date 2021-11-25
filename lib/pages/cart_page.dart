import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:flutter_project1/widget/themes.dart';
class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: "Cart".text.make(),
    ),
    );
  }
}