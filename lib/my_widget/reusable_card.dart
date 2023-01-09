import 'package:bmi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final String text;
  double size;
  double fontSize;
  final Color? iconColor ;
  final Function()?  onPressed;

  ReusableCard(
      {Key? key,
      this.color = const Color(0xff1d1e33),
      this.icon,
      required this.text,
      this.size = 24,
      this.fontSize = 0,
      this.iconColor,
      this.onPressed,

      })

      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size,
              color: iconColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: fontSize == 0 ? 25 : fontSize,color: AppColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}
