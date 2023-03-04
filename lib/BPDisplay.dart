
import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tutorial/main.dart';
import 'calibration.dart';
import 'main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


// Value class to hold Values
class Values{
  String name="";
  String syscalib="";
  String diacalib="";
  List<int> syscal=[];

  int diacal=0;

  set get_sys(List<int> sys)
  {
    val.syscal=sys;

  }
  set get_dia(int dia)
  {
    val.diacal=dia;
  }

} // End of Value Class


class Bpdisplay extends StatefulWidget {

  Bpdisplay({Key? key }) : super(key: key);

  //Stream<List<int>> stream=Stream.empty();


  @override
  State<Bpdisplay> createState() => _BpdisplayState();
}


class  _BpdisplayState extends State<Bpdisplay> {


  @override
  Widget build(BuildContext context) {
    string_parser( i){
      String a="";
      List<int> al=[];
      i=String.fromCharCodes(i);
      i=i.toString();
      for(int d=0;d<13;d++){
        if(i[d]!=","){
          a=a+i[d];
        }
        else{  print(a);
          a="";
          al.add(int()a);

        }
      }



    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Data',style: TextStyle(color: Colors.white,letterSpacing: 1.0),),
        backgroundColor: Colors.blue[900],
        shadowColor: Colors.lightBlue[400],
      ),
      backgroundColor: Colors.white,

      body:StreamBuilder(
        stream: h.stream,
        builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.active
              || snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              var i =snapshot.data;
              string_parser(i);
              return Text(
                  String.fromCharCodes(i),
                  style: const TextStyle(color: Colors.red, fontSize: 40)
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }}
  

