import 'package:bio_homework/Calculation.dart';
import 'package:bio_homework/IterationItem.dart';
import 'package:bio_homework/dothemath.dart';
import 'package:flutter/material.dart';

import 'ListScreen.dart';
import 'TextFieldWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<IterationItem> its = [IterationItem(50, 75), IterationItem(22, 33)];

    return MaterialApp(home: HomePage(), theme: ThemeData(fontFamily: "Nunito"),);
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
  bool roundWeirdNumbers = false;

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
        title: Text("Ricos Bio Hausaufgabe", style: TextStyle(fontFamily: 'Nunito'),),
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff1768AC),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Column(
            children: [
              CustomTextField(controller: Controller1, title: "Value1",),
              CustomTextField(controller: Controller2, title: "Value2",),
              CustomTextField(controller: Controller3, title: "diffusion",),
              CustomTextField(controller: Controller4, title: "MaxIteration",),
              Expanded(
                child: Row(
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
                        child: Text("Round Numbers", style: TextStyle(fontFamily: 'Nunito'),),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                        value: roundWeirdNumbers,
                        onChanged: (bool? value){
                          setState(() {
                            roundWeirdNumbers = value!;
                          });
                        }
                    ),
                    Expanded(
                      child: Text("Round Numbers like Frau Hermes", style: TextStyle(fontFamily: 'Nunito'),),
                    ),

                  ],
                ),
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
                    ("Iterate", style: TextStyle(color: Colors.white, fontFamily: 'Nunito'),)
                  ),
                ),
                onTap: (){
                  DoTheMath mathStuff = DoTheMath(
                      double.parse(Controller1.text),
                      double.parse(Controller2.text),
                      double.parse(Controller3.text),
                      int.parse(Controller4.text),
                      double.parse("0"),
                      roundNumbers,
                      roundWeirdNumbers,
                  );
                  mathStuff.StartIteration();

                  final List<Calculation> calcs = mathStuff.Iterate();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListScreen(calcs: calcs)),
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



