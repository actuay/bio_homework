import 'dart:math';
import 'package:bio_homework/Calculation.dart';
import 'package:bio_homework/IterationItem.dart';
import 'package:bio_homework/calculationItem.dart';
import 'package:flutter/material.dart';

class DoTheMath{

  double value1;
  double value2;

  double diffusionFactor;
  int maxIterations;
  double target;

  bool roundNumbers;
  bool roundWeirdNumbers;

  DoTheMath(
      this.value1,
      this.value2,
      this.diffusionFactor,
      this.maxIterations,
      this.target,
      this.roundNumbers,
      this.roundWeirdNumbers,
      );

  late double X1;
  late double X2;

  late double Y1;
  late double Y2;

  void StartIteration(){
    X1 = value1;
    X2 = value2;
  }

  IterationItem GetRoundedVals(double val1, double val2, double diffFac){

    IterationItem Item = IterationItem(
      (val1 - val1 * diffFac + val2 * diffFac).roundToDouble(),
      (val2 - val2 * diffFac + val1 * diffFac).roundToDouble(),
    );
    return Item;
  }

  IterationItem GetWeirdRoundedVals(double val1, double val2, double diffFac){
    IterationItem Item = IterationItem(
      roundDouble(val1 - val1 * diffFac + val2 * diffFac, 1),
      roundDouble(val2 - val2 * diffFac + val1 * diffFac, 1),
    );
    return Item;
  }

  IterationItem GetNewVals(double val1, double val2, double diffFac){
    IterationItem Item = IterationItem(
      val1 - val1 * diffFac + val2 * diffFac,
        val2 - val2 * diffFac + val1 * diffFac,
    );
    return Item;
  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  List<Calculation> Iterate(){

    List<Calculation> calcs = [];

    for(int i = 0; i <= maxIterations || i == target; i++){

      IterationItem Item;
      CalculationItem calcItem;
      if(roundNumbers){
        calcItem = CalculationItem(X1, X2, diffusionFactor);
        Item = GetRoundedVals(X1, X2, diffusionFactor);
        calcItem = CalculationItem(calcItem.val1.roundToDouble(), calcItem.val2.roundToDouble(), diffusionFactor);
      }else if(roundWeirdNumbers){
        calcItem = CalculationItem(X1, X2, diffusionFactor);
        Item = GetWeirdRoundedVals(X1, X2, diffusionFactor);
        calcItem = CalculationItem(calcItem.val1.roundToDouble(), calcItem.val2.roundToDouble(), diffusionFactor);
      } else{
        Item = GetNewVals(X1, X2, diffusionFactor);
        calcItem = CalculationItem(X1, X2, diffusionFactor);
        Item.val1 = roundDouble(Item.val1, 3);
        Item.val2 = roundDouble(Item.val2, 3);
        calcItem.val1 = roundDouble(calcItem.val1, 3);
        calcItem.val2 = roundDouble(calcItem.val2, 3);
      }

      calcs.add(Calculation(Item, calcItem));

      X1 = Item.val1;
      X2 = Item.val2;
    }

    if(roundWeirdNumbers){
      for(int i = 0; i <= calcs.length - 1; i++){
        calcs[i].iterationItem = IterationItem(
            calcs[i].iterationItem.val1.roundToDouble(),
            calcs[i].iterationItem.val2.roundToDouble(),
        );
        calcs[i].calculationItem = CalculationItem(
            calcs[i].calculationItem.val1.roundToDouble(),
            calcs[i].calculationItem.val2.roundToDouble(),
            diffusionFactor);
      }
    }

    return calcs;
  }

}