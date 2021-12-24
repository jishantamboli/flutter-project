import 'package:flutter/material.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/widget/add_to_cart.dart';
import 'package:flutter_project1/widget/home_widgets/book.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Book(catelog: catelog).wh(120, 50),
            // "₹${catelog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catelog: catelog,
            ).wh(50, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catelog.id.toString()),
                child: Image.network(catelog.image),
              ).h32(context),
              Expanded(
                  child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "₹${catelog.price}"
                        .text
                        .bold
                        .xl2
                        .color(Colors.red)
                        .make()
                        .pOnly(left: 8),
                    catelog.name.text.xl2
                        .color(context.accentColor)
                        .bold
                        .make()
                        .pOnly(left: 8)
                        .py2(),
                    catelog.desc.text.color(Colors.grey).make().pOnly(left: 8),
                    30.heightBox,
                    "Description".text.bold.xl2.make().pOnly(left: 8),
                    'Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.'
                        .text
                        .color(Colors.grey)
                        .make()
                        .p8()
                  ],
                ).py4(),
              ))
            ],
          )),
    );
  }
}
