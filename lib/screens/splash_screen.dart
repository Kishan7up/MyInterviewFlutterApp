
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kishanrathoddemoapp/screens/home_screen.dart';
import 'package:kishanrathoddemoapp/utils/generate_utils.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => navigateTo(context, HomeScreen.routeName,clearAllStack: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Screen",
      style: TextStyle(fontSize: 25),
      ),),
    );
  }
}
