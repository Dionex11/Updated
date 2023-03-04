import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/main.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Column(
      children: [
        Image.asset('assets/Animation.gif',height: 200,
          width: 200,),
        SizedBox(height: 8,),
        Text('BP Monitor',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,)),
      ],
    ),
        backgroundColor: Colors.black,
        splashIconSize: 250,
        duration: 1700,
        nextScreen: Home());
  }
}
