import 'dart:async';
import 'package:flutter/material.dart';
import 'package:helping_hands_v2/landing_page.dart';
import 'package:helping_hands_v2/size_config.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, LandingPage.routeName);
      // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: SizeConfig.width! - 50,
          height: SizeConfig.height! - 100,
          child: Lottie.asset(
            "assets/animations/splash_anim.json",
          ),
        ),
      ),
    );
  }
}
