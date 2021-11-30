import 'package:flutter/material.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({Key? key, required this.catelog})
   : assert (catelog != null),
     super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar:   Container(
        color: context.cardColor,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl4.red800.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple),
                      shape: MaterialStateProperty.all(StadiumBorder(),)
                    ),
                    child: "Add to cart".text.make(),
                  ).wh(120, 50)
                ],
              ).p32(),
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
            child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
              color:context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                   catelog.name.text.xl4.color(context.accentColor).bold.make(),
            catelog.desc.text.xl.color(Colors.grey).make(),
            10.heightBox,
            'Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita, ipsum sadipscing takimata lorem gubergren sea nonumy elitr sed. Tempor ut dolores clita kasd at at diam, est sanctus.'.text.color(Colors.grey).make().p16()       
             ],
              ).py24(),
              ),
            ))
        ],
          )
      ),
    );
  }
}
