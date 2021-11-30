import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_project1/models/cart.dart';
import 'package:flutter_project1/models/catelog.dart';
import 'package:flutter_project1/pages/home_detail_page.dart';
import 'package:flutter_project1/widget/themes.dart';

import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                )),
            child: CatelogItem(
              catelog: catelog,
            ),
          );
        });
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
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
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price}".text.bold.xl.make(),
                _AddToCart(catelog: catelog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(140).make().py8();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catelog;
  const _AddToCart(
   {
    Key? key, 
    required this.catelog,
  }) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catelog = CatelogModel();
        final _cart = CartModel();
        _cart.catelog = _catelog;
        _cart.add(widget.catelog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
