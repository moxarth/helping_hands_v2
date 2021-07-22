import 'package:flutter/material.dart';
import 'package:helping_hands_v2/constants/constants.dart';
import 'package:helping_hands_v2/widgets/custom_appbar.dart';
import 'package:helping_hands_v2/widgets/custom_input.dart';

import 'login_page_body.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text("SIGN IN"),
      ),
      body: LoginPageBody(formKey: _formKey),
    );
  }
}
