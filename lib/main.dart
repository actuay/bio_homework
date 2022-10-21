import 'package:bio_homework/IterationItem.dart';
import 'package:bio_homework/dothemath.dart';
import 'package:flutter/material.dart';

import 'ListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<IterationItem> its = [IterationItem(50, 75), IterationItem(22, 33)];

    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller1 = TextEditingController();
  final Controller2 = TextEditingController();
  final Controller3 = TextEditingController();
  final Controller4 = TextEditingController();
  final Controller5 = TextEditingController();
  bool roundNumbers = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ricos Bio Hausaufgabe"),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: Controller1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Value 1",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: Controller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Value 2",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: Controller3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "diffusion",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: Controller4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "MaxIterations",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: Controller5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "target",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: roundNumbers,
                      onChanged: (bool? value){
                        setState(() {
                          roundNumbers = value!;
                        });
                      }
                  ),
                  Expanded(
                      child: Text("Round Numbers"),
                  ),

                ],
              ),
              InkWell(
                child: Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(child: Text
                    ("Iterate", style: TextStyle(color: Colors.white),)
                  ),
                ),
                onTap: (){
                  DoTheMath mathStuff = DoTheMath(
                      double.parse(Controller1.text),
                      double.parse(Controller2.text),
                      double.parse(Controller3.text),
                      int.parse(Controller4.text),
                      double.parse(Controller1.text),
                      roundNumbers,
                  );
                  mathStuff.StartIteration();

                  final List<IterationItem> its = mathStuff.Iterate();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListScreen(iterations: its)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}



