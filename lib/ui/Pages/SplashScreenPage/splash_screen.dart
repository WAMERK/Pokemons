import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pokemon/Constants/assets.dart';
import 'package:pokemon/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  StateMVC<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  getState() async {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Navigator.pushReplacementNamed(context, Routes.homePage);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.logo,
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
