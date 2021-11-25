import 'package:flutter/material.dart';
import 'package:flutter_project1/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      "Catelog App".text.xl5.bold.color(context.theme.accentColor).make(),
      "Trending Products".text.xl2.make(),
    ]);
  }
}