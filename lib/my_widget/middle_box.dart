import 'package:bmi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MiddleBox extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  //final String text;
  double size;
  double fontSize;
  final Color? iconColor ;
  //void Function(double)?  onSlid;
  //int userHeight ;
  final Widget myWidget;
    MiddleBox({
    Key? key,
    this.color = const Color(0xff1d1e33),
    this.icon,
   // required this.text,
    this.size = 24,
    this.fontSize = 0,
    this.iconColor, required this.myWidget,
  //  this.onSlid,
   // required this.userHeight, required this.myWidget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myWidget;
  }
}
