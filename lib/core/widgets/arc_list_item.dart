import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ArcItemList extends StatelessWidget {
  final Map? myArcData;
  ArcItemList({Key? key, this.myArcData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tap${myArcData.toString()}');
      },
      child: [
        Image.network(myArcData!["image"]),
        _detail(context),
      ].vStack().card.make(),
    );
  }

  Widget _detail(BuildContext context) {
    return [
      [
        '${myArcData!["name"]}'.text.headline5(context).make(),
        'desciption'.text.bodyText2(context).make(),
      ].vStack(crossAlignment: CrossAxisAlignment.stretch).expand(),
      Icon(Icons.menu_book_rounded),
    ].hStack().box.teal500.p8.make();
  }
}
