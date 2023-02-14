
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tutorial/BPDisplay.dart';
import 'package:tutorial/Splash.dart';
import 'calibration.dart';
import 'About.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'BP Monitor',
      theme: ThemeData.dark(),

      routes: {
        '/': (context) => const Splashscreen(),
        '/Home':(context) => Home(),
        '/calib':(context) =>const Calib(),
        '/BP':(context)=>const Bpdisplay(),
        '/About':(context)=>const About(),
      }));
}


var Characteristics;
Values v=Values();
class Bluetooth{

  var syscal;
  var diacal;
  Stream<List<int>> stream=Stream.empty();
  final _controller=StreamController<int>();
  Stream<int> get stream=>_controller.stream;

  send_sys_data(int val)
  async {
        for(BluetoothCharacteristic c in Characteristics) {
          if(c.uuid.toString()=="6dd5152b-de87-4823-aaa4-c43c58d5c945") {
            await c.write([val]);
          }

        }
      }

  send_dia_data(int val)
  async {
    for(BluetoothCharacteristic c in Characteristics) {
      if(c.uuid.toString()=="eb988f82-a7c8-11ed-afa1-0242ac120002") {
        await c.write([val]);
      }

    }
  }

  read_sys_value()
  async{
    for(BluetoothCharacteristic c in Characteristics) {
      if(c.uuid.toString()=="56268214-4c39-4d5e-a74d-186b335c96b5")
        {
           var a=await c.read();
           print(a);
           syscal=a[0];
           //_controller.sink.add(syscal);
           v.get_sys=syscal;
           await h.read_dia_value();
           final myStream= h.read_sys_value().stream;
           final sub= myStream.listen((data)=>print(data));

        }

    }}
    read_dia_value()
    async {
      for (BluetoothCharacteristic c in Characteristics) {
        if (c.uuid.toString() == "2e8bd505-da2e-4285-8979-5c85fc2c2520") {
          var a = await c.read();
          print(a[0]);
          diacal = a[0];
          print(diacal);
          v.get_dia = diacal;

        }
      }
    }

}

FlutterBlue flutterBlue = FlutterBlue.instance;
List<BluetoothDevice> devices= <BluetoothDevice>[];

class  Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  Home home0=Home();
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
                            const Icon(Icons.device_unknown,size: 45.0,color: Colors.blue,),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(device.name == '' ? 'Unknown device' : device.name,
                                  style: const TextStyle(letterSpacing: 2.0,fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13.0),),
                              ),
                            ),
                           ]
              ),
                    ),
                   Center(child: Text(device.id.toString())),
                   const SizedBox(height:5.0),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () async {
                  await  device.connect();
                    List<BluetoothService> services = await device.discoverServices();
                    services.forEach((service) {
                    Characteristics = service.characteristics;
                    Navigator.pushNamed(context, '/calib');
                    Bpdisplay(device: device,);
                  });


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
                add_device(r.device);
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



