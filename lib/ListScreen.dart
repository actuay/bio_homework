

import 'package:bio_homework/ContainerWidget.dart';
import 'package:flutter/material.dart';

import 'IterationItem.dart';

class ListScreen extends StatelessWidget {

  final List<IterationItem> iterations;

  ListScreen({Key? key, required this.iterations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ricos Bio Hausaufgabe:"),
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: iterations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
              child: ContainerWidgetThing(
                  index: index,
                  val1: iterations[index].val1,
                  val2: iterations[index].val2,
              ),
            );
          }
      ),
    );
  }
}
