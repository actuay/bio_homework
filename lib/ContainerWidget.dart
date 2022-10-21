

import 'package:flutter/material.dart';

class ContainerWidgetThing extends StatelessWidget {

  final int index;
  final double val1;
  final double val2;

  const ContainerWidgetThing({Key? key, required this.index, required this.val1, required this.val2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(index.toString())
          ),
          Row(
            children: [
              Expanded(child: Center(child: Text("Value 1: " + val1.toString()))),
              Padding(padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0)),
              Expanded(child: Center(child: Text("Value 2: " + val2.toString()))),
            ],
          ),
        ],
      ),
    );
  }
}
