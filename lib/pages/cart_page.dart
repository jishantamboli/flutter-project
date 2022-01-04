import 'package:NearMe/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/core/store.dart';
import 'package:NearMe/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyTheme.redtheme,
        title: "Cart".text.color(Colors.white).make(),
      ),
      body: Column(
        children: [
          _Cartlist().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         "₹${_cart.totalPrice}"
         .text.bold.xl4.color(MyTheme.redtheme).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Booking not supported yet !!".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.redtheme),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 45,vertical: 12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))

                ),
            child: "Book".text.xl.white.make(),
          )
        ],
      ),
    );
  }
}

class _Cartlist extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Removemutation]);
    return _cart.items.isEmpty
        ? Image.asset("assets/images/house2.gif")
        //  "OOOpppsss !!!!  Nothing to show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  Removemutation(item: _cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
