import 'dart:core';
import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.weight, this.height, this.bmi});

  final int? weight;
  final int? height;
  double? bmi;

  String calculateBMI(){
    bmi = (weight! /  pow(height!/100 , 2));
    return bmi!.toStringAsFixed(1);
  }

  String? getResult(){
    if (bmi! >= 25){
      return 'OVERWEIGHT';
    }
    else if (bmi! > 18.5){
      return 'NORMAL';
    }
    else {
      return 'UNDERWEIGHT';
    }
  }

  String? resultInterpretation(){
    if (bmi! >= 25){
      return 'Your weight has exceeded the normal weight, try doing more exercise.';
    }
    else if (bmi! > 18.5){
      return 'Your weight is exactly Normal. Good Job!';
    }
    else {
      return 'Your weight is beyond the normal weight, try keeping a sufficient balanced diet.';
    }
  }
}