

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tutorial/BPDisplay.dart';
import 'calibration.dart';
import 'About.dart';
import 'BPDisplay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'BP Monitor',
      theme: ThemeData.dark(),

      routes: {
        '/': (context) => Home(),
        '/calib':(context) =>Calib(),
        '/BP':(context)=>Bpdisplay(),
        '/About':(context)=>About(),
      }));
}
class  Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  List<BluetoothDevice> devices= <BluetoothDevice>[];


  List<Container> containers = <Container>[];

  add_device(BluetoothDevice device){
    if(!devices.contains(device))
      {
        devices.add(device);
      }

  }

  ListView listViewOfDevices() {
    for (BluetoothDevice device in devices) {
      containers.add(
        Container(
          height: 50,
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:<Widget> [
                            Icon(Icons.device_unknown,size: 45.0,color: Colors.blue,),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(device.name == '' ? 'Unknown device' : device.name,
                                  style: TextStyle(letterSpacing: 2.0,fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13.0),),
                              ),
                            ),
                           ]
              ),
                    ),
                   Center(child: Text(device.id.toString())),
                   SizedBox(height:5.0),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/calib');

                },
                  child: Text('Connect',style: TextStyle(letterSpacing:2.0),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
              )

            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 240,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(70))),
        child: ListView(
          padding: EdgeInsets.zero,
          children:   [
            DrawerHeader(decoration: const BoxDecoration(
              color: Color.fromRGBO(45, 3, 59, 150),
            ),child:
            Column(
                children:<Widget>[ 
                  Icon(Icons.monitor_heart_outlined,color: Colors.red,size: 70,),
                  Text("BP Monitor",style: TextStyle(fontSize: 40),)

                ]
            ),
            ),
         ListTile(
           leading: Icon(Icons.info),
           title: Text("About",style: TextStyle(fontSize: 18),),
           onTap: (){
             Navigator.pushNamed(context, '/About');
           },
         ),


          ],
        ),
      ),
      appBar: AppBar(
        leading: Icon(Icons.monitor_heart_outlined,color: Colors.red,size: 50,),
        title: Text('BP Monitor'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        elevation: 10.0,
        child: Icon(Icons.search,size: 40,color: Colors.white,),
        onPressed: (){
          // Start scanning
          setState(() {
            flutterBlue.startScan(timeout: Duration(seconds: 4));

            // Listen to scan results
            var subscription = flutterBlue.scanResults.listen((results) {
              // do something with scan results
              for (ScanResult r in results) {
                print(r.device.type);
                print(devices);
                print('${r.device.name} found! rssi: ${r.rssi}');
                add_device(r.device);
              }
            });

          });




// Stop scanning
          flutterBlue.stopScan();
        },
      ),

      body:listViewOfDevices(),


    );
  }
}



