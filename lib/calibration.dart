
import 'package:flutter/material.dart';
import 'BPDisplay.dart';

Values val=Values();
class Calib extends StatefulWidget {
  const Calib({Key? key}) : super(key: key);


  @override
  State<Calib> createState() => _CalibState();
}
Widget datacard(context){
  return SingleChildScrollView(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 100, 20, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      color: Colors.black,
      elevation: 20,
      shadowColor: Colors.redAccent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20,80,20,50),
        child: Column(
          children: <Widget>[TextField(
            onChanged: (text){

              val.name=text;
              print(val.name);

            },
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.green,
                decoration:  InputDecoration(
                hintText: 'Enter Patient Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(50) ),
                label: Text('Patients  Name',style: TextStyle(color: Colors.blue, ),),
                filled: true,
                fillColor: Colors.white,

          )),
            SizedBox(height: 20),
            TextField(
                style: TextStyle(color: Colors.black),
                 cursorColor: Colors.green,
                  decoration:  InputDecoration(
                  hintText: 'Enter Systolic Calibration Values',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(50) ),
                  label: Text('Systolic Calibration Values',style: TextStyle(color: Colors.blue, ),),
                  filled: true,
                  fillColor: Colors.white,

              )),
              SizedBox(height: 20),
            TextField(
              cursorColor: Colors.green,
              style: TextStyle(color: Colors.black),
              decoration:  InputDecoration(

                  hintText: 'Enter Diastolic Calibration Values',
                  hintStyle: TextStyle(color: Colors.grey),
                  border:  OutlineInputBorder(borderRadius:BorderRadius.circular(50) ),
                  label: Text('Diastolic Calibration Values',style: TextStyle(color: Colors.blue, ),),
                  filled: true,
                  fillColor: Colors.white,


              ),

            ),
            SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/BP');

          },  style:ElevatedButton.styleFrom(backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size.fromWidth(220),
              shadowColor: Colors.green,
              elevation: 10,

          ),
              child: Text('Get BP Values',style: TextStyle(letterSpacing: 2),))],
        ),
      ),
    ),
  );
}
class _CalibState extends State<Calib> {
  String value="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(45, 3, 59, 150),
        body: datacard(context),
      ),
    );
  }
}
