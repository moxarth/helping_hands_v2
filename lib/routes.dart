import 'package:flutter/material.dart';
import 'package:helping_hands_v2/landing_page.dart';
import 'package:helping_hands_v2/screens/home_page/home_page.dart';
import 'package:helping_hands_v2/screens/login_page/login_page.dart';
import 'package:helping_hands_v2/screens/splash_page/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LandingPage.routeName: (context) => LandingPage(),
  MyHomePage.routeName: (context) => MyHomePage(),
  LoginPage.routeName: (context) => LoginPage(),
  SplashScreen.routeName: (context) => SplashScreen(),
};