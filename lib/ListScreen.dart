

import 'package:bio_homework/ContainerWidget.dart';
import 'package:flutter/material.dart';

import 'Calculation.dart';
import 'IterationItem.dart';

class ListScreen extends StatelessWidget {

  final List<Calculation> calcs;

  ListScreen({Key? key, required this.calcs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ricos Bio Hausaufgabe:"),
        shadowColor: Colors.transparent,
          backgroundColor: Color(0xff1768AC),
      ),
      body: ListView.builder(
          itemCount: calcs.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
              child: ContainerWidgetThing(
                  index: index,
                  calc: calcs[index],
              ),
            );
          }
      ),
    );
  }
}
