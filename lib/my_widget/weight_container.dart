import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class WeightContainer extends StatelessWidget {
  final String text;
  int? userWeight;
  void Function()? lowOnChange;
  void Function()? addChange;

   WeightContainer(
     {Key? key,
     required this.text,
     this.userWeight,
     this.lowOnChange,
     this.addChange,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(10),
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor),),
          SizedBox(height: 5),
          Text(userWeight.toString(),style:TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: AppColors.textHeightColor)),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 0,
                onPressed: lowOnChange,
                color: Color(0xFF292845),
                textColor: Colors.white,
                child: Icon(
                  Icons.remove,
                  size: 24,
                ),
                padding: EdgeInsets.all(13),
                shape: CircleBorder(),
              ),
              SizedBox(width: 10),
              MaterialButton(
                minWidth: 0,
                onPressed: addChange,
                color: Color(0xFF292845),
                textColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 24,
                ),
                padding: EdgeInsets.all(13),
                shape: CircleBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
