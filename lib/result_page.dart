import 'package:bmi_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

   ResultPage({required this.bmiResult, required this.resultText, required this.interpretation,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left:30,top: 20,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Your Result",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
                ),
                Expanded(child: Container())
              ],
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 30, top: 20),
                decoration: BoxDecoration(
                  color: AppColors.mainAppColor,
                ),
                child: Column(
                  children: [
                  Text(resultText,style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color: Colors.green),),
                    SizedBox(height: 20),
                    Text(bmiResult,style:TextStyle(fontSize:80,fontWeight:FontWeight.w600,color: Colors.white),),
                    SizedBox(height: 15),
                    Text("Normal BMI range",style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color: Colors.grey),),
                    Text("18,5 - 25 kg/m2",style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color: Colors.white),),
                    SizedBox(height: 50),
                    Text(interpretation,textAlign: TextAlign.center,style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color: Colors.white,),),
                    SizedBox(height: 50),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                     padding: EdgeInsets.symmetric(vertical: 15),
                     color: Color(0xFF262441),
                      child: Center(
                        child:Text("Save Result",style:TextStyle(fontSize:25,fontWeight:FontWeight.w500,color: Colors.white70),),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.maxFinite,
        color: AppColors.bottomAppColor,
        child: Center(
          child: Text(
            "CALCULATE YOUR BMI",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.textHeightColor),
          ),
        ),
      ),
    );
  }
}
