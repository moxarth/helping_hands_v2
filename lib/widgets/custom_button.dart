import 'package:flutter/material.dart';
import 'package:helping_hands_v2/size_config.dart';

class CustomButton extends StatelessWidget {
  Function()? onPressed;
  String? title;
  bool? isLoading;

  CustomButton({Key? key, this.onPressed, this.title, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        onPressed: onPressed,
        child: Stack(
          children: [
            Visibility(
              visible: !isLoading!,
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20.0),
                  color: Colors.white
                ),
              ),
            ),
            Visibility(
              visible: isLoading!,
              child: Container(
                height: getProportionateScreenHeight(25.0),
                width: getProportionateScreenHeight(25.0),
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(18.0),
          )
        ),
      ),
    );
  }
}
