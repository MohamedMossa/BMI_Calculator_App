import 'package:bmi_app/result_page.dart';
import 'package:bmi_app/utils/app_colors.dart';
import 'package:bmi_app/utils/calculation_brain.dart';
import 'package:flutter/material.dart';
import 'my_widget/age_container.dart';
import 'my_widget/weight_container.dart';
import 'my_widget/middle_box.dart';
import 'my_widget/reusable_card.dart';





enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  // Color maleCardColor = AppColors.inActiveColor;

  // Color femaleCardColor = AppColors.inActiveColor;

  /// 1 for male , 2 female
  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == AppColors.inActiveColor) {
  //       maleCardColor = AppColors.activeCardColor;
  //       femaleCardColor = AppColors.inActiveColor;
  //     } else {
  //       maleCardColor = AppColors.inActiveColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == AppColors.inActiveColor) {
  //       femaleCardColor = AppColors.activeCardColor;
  //       maleCardColor = AppColors.inActiveColor;
  //     } else {
  //       femaleCardColor = AppColors.inActiveColor;
  //     }
  //   }
  // }
  Gender? selectedGender;




  int userWeight = 50;
  void weightIncrement() {
    setState(() {
      userWeight++;
    });
  }
  void weightDecrement() {
    setState(() {
      userWeight--;
    });
  }
  int userAge=16;
  void ageIncrement() {
    setState(() {
      userAge++;
    });
  }
  void ageDecrement() {
    setState(() {
      userAge--;
    });
  }
  int userHeight=180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            ///first App Row
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    text: 'Male',
                    fontSize: 25,
                    icon: Icons.male,
                    size: 80,
                    color: selectedGender == Gender.male
                        ? AppColors.activeCardColor
                        : AppColors.inActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    text: "Female",
                    icon: Icons.female_outlined,
                    size: 80,
                    color: selectedGender == Gender.female
                        ? AppColors.activeCardColor
                        : AppColors.inActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MiddleBox(
              myWidget: Container(
              padding: EdgeInsets.only(top: 15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.mainAppColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline:TextBaseline.alphabetic,
                    children: [
                      Text(userHeight.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textHeightColor)),
                      const SizedBox(width: 5),
                      Text("cm",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor)),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: AppColors.thumbColor,
                        overlayColor: AppColors.overlayColor,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                        inactiveTickMarkColor: AppColors.inActiveSliderColor
                    ),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 100,
                      max:220,
                      onChanged: (double value){

                        setState(() {
                          userHeight=value.round();
                        });
                      },

                    ),
                  ),
                ],
              ),
            ),


            ),
          ),
          Expanded(
            ///final App Row
            child: Row(
              children: [
                Expanded(
                  child: WeightContainer(
                      text: 'Weight',
                      addChange: () {
                        weightIncrement();
                      },
                      userWeight: userWeight,
                      lowOnChange: () {
                        weightDecrement();
                      }),
                ),
                Expanded(
                  child: AgeContainer(
                    addChange: (){
                      ageIncrement();
                    },
                    lowOnChange:(){ ageDecrement();},
                    text: 'Age',
                    userAge: userAge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          CalculationBrain calc = CalculationBrain(userHeight: userHeight, userWeight: userWeight, );
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
            bmiResult: calc.bmiCalculate(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),),

          ));
        },
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.maxFinite,
          height: 62,
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
      ),
    );
  }
}
