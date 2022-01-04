import 'package:velocity_x/velocity_x.dart';

import 'package:NearMe/core/store.dart';
import 'package:NearMe/models/catelog.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
    
  }
}

class Removemutation extends VxMutation<MyStore> {
  final Item item;

  Removemutation({required this.item});
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}

