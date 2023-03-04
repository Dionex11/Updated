import 'package:flutter/material.dart';
import 'calibration.dart';
import 'main.dart';
//Bluetooth h2=Bluetooth();
class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Center(child:
      Text("calibration done",style: TextStyle(color: Colors.white))),
      ElevatedButton(onPressed: (){}, child: Text("Estimate BP"),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
      ])
    ,floatingActionButton: FloatingActionButton(onPressed: () {

      h.read_sys_value();
        Navigator.pushNamed(context,'/BP');
         },),
    );
  }
}
