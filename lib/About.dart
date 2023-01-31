import 'package:flutter/material.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('About'),
      backgroundColor: Colors.black,
    ),
    backgroundColor: const Color.fromRGBO(35, 0, 70, 130),
    body: Container(
        width: 300,
        margin: const EdgeInsets.all(40),
        
        decoration:BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [BoxShadow(color: Colors.red,spreadRadius: 2),]

        ),
        child: Column(
          children: [const SizedBox(height: 50,),
            const Divider(thickness: 2,),
            const Text('Designed And Developed By,',
            style: TextStyle(letterSpacing: 2.0,fontSize:   16,fontWeight: FontWeight.w900),),
            const Divider(thickness: 2,),
            const SizedBox(height: 20,),
            const Text('Dionex11',
              style: TextStyle(letterSpacing: 2.0,fontSize:   16,fontWeight: FontWeight.w400),),
            const SizedBox(height: 20,),
            const Divider(thickness: 2,),
            Row(children: const [
              SizedBox(width: 80,),
              Icon(Icons.contact_mail),
              SizedBox(width: 10,),
            Text('Contact',
              style: TextStyle(letterSpacing: 2.0,fontSize:   16,fontWeight: FontWeight.w900),)]
          ),
            const Divider(thickness: 2,),
            const SizedBox(height: 20,),
            const Text('code.testx11@gmail.com',style: TextStyle(fontSize: 15),),
            const SizedBox(height: 20,),
            const Divider(thickness: 2,),
    ])
    ),

    );}
}
