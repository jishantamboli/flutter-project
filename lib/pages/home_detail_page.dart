import 'package:NearMe/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:NearMe/models/catelog.dart';
import 'package:NearMe/widget/add_to_cart.dart';
import 'package:NearMe/widget/home_widgets/book.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;
  String tit = ("Select Date & Guest");
  String discription =
      "Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.Labore clita ipsum ea kasd ea. Labore ipsum amet lorem ipsum at voluptua elitr rebum clita,Tempor ut dolores clita kasd at at diam, est sanctus.";
  var titlestyle =
      TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

  HomeDetailPage({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(backgroundColor: Colors.red),
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
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Hero(
                  tag: Key(catelog.id.toString()),
                  child: Image.network(catelog.image),
                ).h32(context),
                SingleChildScrollView(
                  child: Expanded(
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
                            .color(MyTheme.redtheme)
                            .make()
                            .pOnly(left: 8),
                        catelog.name.text.xl
                            .color(context.accentColor)
                            .bold
                            .make()
                            .pOnly(left: 8)
                            .py2(),
                        catelog.desc.text
                            .color(Colors.grey)
                            .make()
                            .pOnly(left: 8),
                        Divider(
                          thickness: 4,
                        ),
                        10.heightBox,
                        "Description".text.bold.xl.make().pOnly(left: 8),
                        ReadMoreText(
                          discription,
                          trimLines: 5,
                          textAlign: TextAlign.justify,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: "read more",
                          trimExpandedText: "show less",
                          lessStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.redtheme
                          ),
                          moreStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.redtheme
                          ),
                          style: TextStyle(fontSize: 13,color: Colors.grey),
                        ).p8(),
                         Divider(thickness: 4),
                        Container(
                            color: Colors.white,
                            height: double.maxFinite,
                            width: 500,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tit,
                                  style: titlestyle,
                                  textAlign: TextAlign.left,
                                ).py2(),
                                Container(
                                  color: Colors.teal.shade100,
                                  height: 100,
                                  width: 400,
                                  child: Text(" "),
                                ).p(12),
                              ],
                            )),
                      ],
                    ).py4(),
                  )),
                )
              ],
            )),
      ),
    );
  }
}
