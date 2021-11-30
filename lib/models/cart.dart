import 'package:flutter_project1/models/catelog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;
  
  //catelog field
  late CatelogModel _catelog;

  //collection of Ids - store ids of each item
  final List<int> _itemIds = [];

  //Get catelog
  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel NewCatelog) {
    assert(NewCatelog != null);
    _catelog = NewCatelog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catelog.getByID(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
