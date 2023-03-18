
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
      List<String> al=[];
      i=String.fromCharCodes(i);
      i=i.toString();
      int l=i.length;
      for(int d=0;d<l;d++){
        if(i[d]!=","){
          a=a+i[d];
        }
        else{
          al.add(a);
          a="";
          print("list  value ------------");
          print(al);

        }
      }
     al.add(a);
    return al;

    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Data',style: TextStyle(color: Colors.white,letterSpacing: 1.0),),
        backgroundColor: Color.fromRGBO(141, 2, 31, 50),
      ),
      backgroundColor: Colors.black12,

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
              List<String> d=string_parser(i);
              return Card(
                //shadowColor: Colors.green,
                elevation: 1000,
                surfaceTintColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(41, 1, 51, 100),
                margin: EdgeInsets.fromLTRB(10, 80, 10, 100),
                child: Column(children:[Row(
                  children:[Card(
                    color: Colors.cyan,
                    margin: EdgeInsets.fromLTRB(8, 100, 8, 0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color:Colors.black12,
                      width: 150.0,
                      height: 150.0,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: d[0], style: TextStyle(fontWeight: FontWeight.bold,fontSize:50)),
                              TextSpan(text: 'mmHg', style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color:Colors.yellowAccent,
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color:Colors.black12,
                      width: 150.0,
                      height: 150.0,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: d[1], style: TextStyle(fontWeight: FontWeight.bold,fontSize:50)),
                              TextSpan(text: 'mmHg', style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                  Row(
                    children:[ Card(
                      color:Colors.redAccent,
                      margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color:Colors.black12,
                        width: 150.0,
                        height: 150.0,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: d[2], style: TextStyle(fontWeight: FontWeight.bold,fontSize:50)),
                                TextSpan(text: 'bpm', style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  Card(
                    color: Colors.greenAccent,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color:Colors.black12,
                      width: 150.0,
                      height: 150.0,
                      child: Center(
                        child: RichText(
                        text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                        TextSpan(text: d[3], style: TextStyle(fontWeight: FontWeight.bold,fontSize:50)),
                        TextSpan(text: '%', style: TextStyle(fontWeight: FontWeight.bold,fontSize:18)),
                        ],
                        ),
                        ),),
                      ),
                    ),
                  ]),
                ]),
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
  

