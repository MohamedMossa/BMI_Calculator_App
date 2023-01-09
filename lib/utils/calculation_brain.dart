import 'dart:math';

class CalculationBrain {
  late int userHeight;
  late int userWeight;
   double bmi;

  CalculationBrain ({required this.userHeight,required this.userWeight,this.bmi= 0});




  String bmiCalculate(){
    bmi==1? bmi:
    bmi = userWeight / pow(userHeight/100, 2);
    return bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(bmi>=25){
      return"OverWeight";
    }else if (bmi>=18){
      return "Normal";
    }else{
      return "Under Weight";
    }
  }
  String getInterpretation(){
    if(bmi>=25){
      return"You have a higher than normal body weight. try to exercise more.";
    }else if (bmi>=18){
      return "You have a normal body weight. Good job.";
    }else{
      return "You have a lower than normal body weight.you can eat a bit more.";
    };
  }
  }
