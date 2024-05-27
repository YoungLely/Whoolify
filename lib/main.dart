import 'package:flutter/material.dart';
import 'package:wholify/src/ui/screens/HomeScreen.dart';
import 'package:wholify/src/ui/screens/LoginScreen.dart';
import 'package:wholify/src/ui/screens/Wait.dart';

import 'src/ui/splashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashScreen(),
      routes:{
        '/home': (context) =>  const HomeScreen(),
        '/login': (context) =>  const LoginScreen(),
        '/wait'  : (context) => const Wait(),
      },
    );
  }
}
