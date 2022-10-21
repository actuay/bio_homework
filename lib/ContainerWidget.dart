

import 'package:flutter/material.dart';

class ContainerWidgetThing extends StatelessWidget {

  final int index;
  final double val1;
  final double val2;

  const ContainerWidgetThing({Key? key, required this.index, required this.val1, required this.val2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff03256C)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Text(index.toString()),
        title: Text("                  " + val1.toString() + "                  " + val2.toString()),
      ),
    );
  }
}
