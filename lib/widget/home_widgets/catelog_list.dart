import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:NearMe/models/catelog.dart';
import 'package:NearMe/pages/home_detail_page.dart';
import '../add_to_cart.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            // ignore: prefer_const_constructors
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatelogModel.items.length,
            itemBuilder: (context, index) {
              final catelog = CatelogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catelog: catelog,
                    ),
                  ),
                ),
                child: CatelogItem(catelog: catelog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatelogModel.items.length,
            itemBuilder: (context, index) {
              final catelog = CatelogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catelog: catelog,
                    ),
                  ),
                ),
                child: CatelogItem(catelog: catelog),
              );
            },
          );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
   
    var children2 = [
      Hero(
        tag: Key(catelog.id.toString()),
        child: CatelogImage(
          image: catelog.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catelog.name.text.lg.color(context.accentColor).bold.make(),
          catelog.desc.text.color(Colors.grey).make(),
          8.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "₹${catelog.price}".text.color(Colors.red).bold.xl.make(),
              AddToCart(catelog: catelog)
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(context.isMobile ? 1 : 16))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .roundedLg
        .square(130)
        .make()
        .py4()
        .pOnly(left: 5, right: 5);
  }
}
