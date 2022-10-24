

import 'package:bio_homework/Calculation.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final Calculation calc;

  const DetailScreen({Key? key, required this.calc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculation"),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff1768AC),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff03256C)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text("Value 1 = " + calc.iterationItem.val1.toString()),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("Value 2 = " + calc.iterationItem.val2.toString()),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("Calculation Value 1 = \n \n" + calc.calculationItem.GetCalculationVal1() + "\n \n = " + calc.iterationItem.val1.toString()),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("Calculation Value 2 = \n \n" + calc.calculationItem.GetCalculationVal2() + "\n \n = " + calc.iterationItem.val2.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
