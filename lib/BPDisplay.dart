import 'package:flutter/material.dart';
import 'calibration.dart';
class Values{
  String name="";
  String syscalib="";
  String diacalib="";

}

class Bpdisplay extends StatefulWidget {
  const Bpdisplay({Key? key}) : super(key: key);

  @override
  State<Bpdisplay> createState() => _BpdisplayState();
}

class  _BpdisplayState extends State<Bpdisplay> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Patient Data',style: TextStyle(color: Colors.white,letterSpacing: 1.0),),
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
                  children: const <Widget>[Icon(Icons.person,
                    color: Colors.green,size: 30.0,),
                    SizedBox(width: 10.0,),
                    Text('Patients Name:', style:TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                    )
                    ),],
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
                    Text('Systollic Value:',style:TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  )
                  ),
  ]),
                const Divider(thickness: 2.0,color: Colors.indigo,),
                const SizedBox(height: 10.0,),
                Text(val.syscalib,style:const TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                )
                ),
                const SizedBox(height: 20.0,),
                Row(
                  children:const <Widget>[
                    Icon(Icons.add_box,color: Colors.redAccent,size: 25.0,),
                    SizedBox(width: 10.0,),
                    Text('Diastollic Value:',style:TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black
                  )
                  ),
    ] ),
                const Divider(thickness: 2.0,color: Colors.indigo,),
                Text(val.diacalib,style:TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                )
                ),
              ],
            ),
          ),
        ),
    );
  }
}

