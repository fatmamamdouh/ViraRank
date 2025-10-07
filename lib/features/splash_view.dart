import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ieee/features/on_boarding/views/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveUp = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _moveUp = true;
      });
    });

    Timer(const Duration(milliseconds: 1350), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedAlign(
        duration: const Duration(seconds: 1), 
        curve: Curves.easeInOut,
        alignment: _moveUp ? Alignment.topCenter : Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 20), 
          child: Image.asset(
            'assets/images/ViraRank.png',
            
          ),
        ),
      ),
    );
  }
}
