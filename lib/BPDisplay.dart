
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
  int syscal=0;
  int diacal=0;

  int get get_sys
  {
    return syscal;
  }
  set get_sys(int sys)
  {
    val.syscal=sys;

  }
  set get_dia(int dia)
  {
    val.diacal=dia;
  }

} // End of Value Class


class Bpdisplay extends StatefulWidget {

  Bpdisplay({Key? key,required this.device}) : super(key: key);
  final BluetoothDevice device;
  Stream<List<int>> stream=Stream.empty();


  @override
  State<Bpdisplay> createState() => _BpdisplayState();
}


class  _BpdisplayState extends State<Bpdisplay> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Patient Data',style: TextStyle(color: Colors.white,letterSpacing: 1.0),),
          backgroundColor: Colors.blue[900],
          shadowColor: Colors.lightBlue[400],
    ),
        backgroundColor: Colors.white,

        body: Card(
          margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
          elevation: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          shadowColor: Colors.lightBlue[400],
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  children:  [Icon(Icons.person,
                    color: Colors.green,size: 30.0,),
                    SizedBox(width: 10.0,),
                    Text('Patients Name:', style:TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                    )
                    ),
          ],
                ),
              const Divider(thickness: 2.0,color: Colors.indigo,),
              Text(val.name,style:const TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue
              )
              ),
                const SizedBox(height: 20.0,),

                Row(
                  children:const <Widget>[
                    Icon(Icons.add_box,color: Colors.redAccent,size: 25.0,),
                    SizedBox(width: 10.0,),
                    Text('Systolic Value:',style:TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  )
                  ),
  ]),
                const Divider(thickness: 2.0,color: Colors.indigo,),
                const SizedBox(height: 10.0,),
                Text(val.syscal.toString(),style:const TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                )
                ),
                const SizedBox(height: 20.0,),
                Row(
                  children: <Widget>[
                    Icon(Icons.add_box,color: Colors.redAccent,size: 25.0,),
                    SizedBox(width: 10.0,),
                    Text('Diastolic Value:',style:TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black)),

                    ],

                ),
                const Divider(thickness: 2.0,color: Colors.indigo,),
                Text(
                    val.diacal.toString(),
                    style:const TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black)),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo,
            elevation: 10.0,
            child: Icon(Icons.refresh,size: 40,color: Colors.white,),
            onPressed: (){
              setState(() {
                print("ln");
              });}
        ),
        );
    } // Start
 }   // End of state Class

