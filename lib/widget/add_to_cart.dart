import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/core/store.dart';
import 'package:flutter_project1/models/cart.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;
  AddToCart({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation, Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catelog);
    return ElevatedButton( 
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: catelog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart
          ? Icon(CupertinoIcons.heart_fill, color: Colors.red,)
          : Icon(
              CupertinoIcons.heart
            ),
    );
  }
}
