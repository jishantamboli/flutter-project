import 'package:NearMe/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/models/cart.dart';
import 'package:NearMe/models/catelog.dart';
import 'package:NearMe/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Book extends StatefulWidget {
  final Item catelog;
  Book({Key? key, required this.catelog}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, Removemutation]);
    return ElevatedButton(onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Booking not Supported yet !!".text.make()));
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(MyTheme.redtheme),
    shape: MaterialStateProperty.all(StadiumBorder(),
    )
    ),
    child: "Book".text.xl2.color(Colors.white).make(),
     );
  }
}
