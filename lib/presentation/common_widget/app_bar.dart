import 'package:flutter/cupertino.dart';

class AppBarWidget extends StatelessWidget{
  Widget? widgetLeft;
  Widget? widgetCenter;
  Widget? widgetRight;


  AppBarWidget({super.key, this.widgetLeft, this.widgetCenter, this.widgetRight});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(child: widgetLeft),
        Container(child: widgetCenter),
        Container(child: widgetRight)
      ],
    );
  }

}