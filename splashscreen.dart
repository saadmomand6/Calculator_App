import 'dart:async';

import 'package:flutter/material.dart';
import 'package:calculatorapp/calculator.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculationPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
             Icon(Icons.calculate,size: 100,color: Colors.white,),
            Text("CALCULATOR APP",style: TextStyle(color: Colors.white,fontSize: 35,),),
          ],
        ),
      ),
    );
  }
}