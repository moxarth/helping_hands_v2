import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helping_hands_v2/services/authentication_methods.dart';
import 'package:helping_hands_v2/size_config.dart';
import 'package:helping_hands_v2/widgets/custom_button.dart';
import 'package:helping_hands_v2/widgets/custom_input.dart';

class LoginPageBody extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  const LoginPageBody({Key? key, this.formKey}) : super(key: key);

  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final AuthServices _authServices = AuthServices();
  String email = "", password = "";
  FocusNode? _passwordFocusNode;
  bool isLoading = false;
  bool isForgotPasswordChecked = false;
  late bool isRememberMeTicked = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Text(
                "Welcome Savior!",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                "Sign in with email and password or\n with a social account",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(110),
              ),
              Form(
                key: widget.formKey!,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(40),
                  ),
                  child: Column(
                    children: [
                      CustomInput(
                        validator: (value) {
                          final bool isValidate =
                              EmailValidator.validate(value!);
                          if (value.isEmpty) {
                            return 'Please enter the email';
                          } else if (!isValidate) {
                            return 'Please enter valid email';
                          }
                        },
                        hintText: "Enter the Email",
                        textInputAction: TextInputAction.next,
                        label: "Email",
                        iconData: Icon(
                          Icons.email_outlined,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                        onSubmitted: (value) {
                          _passwordFocusNode!.requestFocus();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      CustomInput(
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Please enter the password with 6+ characters";
                          }
                        },
                        hintText: "Enter the Password",
                        textInputAction: TextInputAction.done,
                        label: "Password",
                        iconData: Icon(
                          Icons.password_outlined,
                          color: Colors.orange,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        focusNode: _passwordFocusNode,
                        obscuredText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isRememberMeTicked,
                                onChanged: (value) {
                                  setState(() {
                                    isRememberMeTicked = value!;
                                  });
                                },
                                activeColor: Theme.of(context).primaryColor,
                              ),
                              Text(
                                "Remember Me",
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print("FORGOT PASSWORD");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.lato(
                                color: Colors.orange.shade500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (widget.formKey!.currentState!.validate()) {
                              await _authServices.registerWithEmailAndPassword(
                                  email, password);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          title: "LOGIN",
                          isLoading: isLoading),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 185,
              ),
              GestureDetector(
                onTap: () {
                  print("CREATE NEW ACCOUNT");
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black12),
                    ),
                  ),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Create a new account",
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
