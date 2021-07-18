import 'package:flutter/material.dart';
import 'package:helping_hands_v2/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userEmail = "", userPassword = "";
  FocusNode? _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("WELCOME"),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInput(
                    label: "Email",
                    hintText: "Enter the email",
                    iconData: Icon(Icons.email),
                    onChanged: (value) {
                      userEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode!.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInput(
                    label: "Password",
                    hintText: "Enter the password",
                    iconData: Icon(Icons.password),
                    obscuredText: true,
                    onChanged: (value) {
                      userEmail = value;
                    },
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
