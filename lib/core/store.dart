import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_project1/models/cart.dart';
import 'package:flutter_project1/models/catelog.dart';

class MyStore extends VxStore {
  CatelogModel catelog;
  CartModel cart;

  MyStore()
      : catelog = CatelogModel(),
        cart = CartModel() {
    cart.catelog = catelog;
  }
}

