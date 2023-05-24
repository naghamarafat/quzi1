import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quzi1/SharedPreController.dart';
import 'package:quzi1/home.dart';
import 'package:quzi1/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreController().getInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:AnimatedSplashScreen(
          splash: Icon(Icons.ac_unit_rounded,size: 100,color: Colors.yellow,),
          duration: 5000,
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.blue,
          nextScreen: SharedPreController().getData("isLogin")?HomePage():LoginPage(),
      ),
    );
  }
}


