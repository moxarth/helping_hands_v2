import 'package:flutter/material.dart';
import 'package:helping_hands_v2/constants/constants.dart';
import 'package:helping_hands_v2/services/authentication_methods.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text("Welcome", style: regularTextStyle),
        titleSpacing: 3.0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset("assets/animations/animation-1.json"),
          ),
          IconButton(
            onPressed: () async {
              await AuthServices().signOut();
              print("SIGNING OUT...");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
