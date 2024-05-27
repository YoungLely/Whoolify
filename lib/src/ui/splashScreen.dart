import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    shared_Preferences();
  }

  void shared_Preferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logged = prefs.getBool('logged') ?? false;
    print("LOGGED: ${logged}");
    if (logged == true) {
      Timer(Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, "/home"));
    } else {
      Timer(Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, "/login"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
