

import 'package:bio_homework/Calculation.dart';
import 'package:bio_homework/DetailSCreen.dart';
import 'package:flutter/material.dart';

class ContainerWidgetThing extends StatelessWidget {

  final int index;
  final Calculation calc;

  const ContainerWidgetThing({Key? key, required this.index, required this.calc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(calc: calc)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff03256C)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Text(index.toString()),
          title: Text("                  " + calc.iterationItem.val1.toString() + "                  " + calc.iterationItem.val2.toString()),
        ),
      ),
    );
  }
}
