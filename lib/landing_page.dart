import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands_v2/screens/home_page/home_page.dart';
import 'package:helping_hands_v2/screens/login_page/login_page.dart';

class LandingPage extends StatefulWidget {
  
  static String routeName = '/landing';

  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        
        else if(snapshot.connectionState == ConnectionState.active){
          dynamic user = snapshot.data;

          // ignore: unnecessary_null_comparison
          if(user == null){
            return LoginPage();
          } else {
            return MyHomePage();
          }
        } 
        
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
