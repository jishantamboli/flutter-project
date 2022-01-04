import 'package:velocity_x/velocity_x.dart';
import 'package:NearMe/models/cart.dart';
import 'package:NearMe/models/catelog.dart';

class MyStore extends VxStore {
  CatelogModel catelog;
  CartModel cart;

  MyStore()
      : catelog = CatelogModel(),
        cart = CartModel() {
    cart.catelog = catelog;
  }
}

