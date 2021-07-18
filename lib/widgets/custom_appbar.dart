import 'package:flutter/material.dart';
import 'package:helping_hands_v2/constants/constants.dart';
import 'package:helping_hands_v2/size_config.dart';

// ignore: camel_case_types
class Custom_AppBar extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool? hasBack;
  const Custom_AppBar({Key? key, this.title, this.hasBack, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTitle = title ?? "title"; 
    IconData newIcon = icon ?? Icons.arrow_back_ios_new;
    bool newHasBack = hasBack ?? false;

    return Container(
      height: getProportionateScreenHeight(55),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        children: [
          if (newHasBack)
            Container(
              margin: EdgeInsets.only(left: getProportionateScreenWidth(50)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black54,
              ),
              width: getProportionateScreenWidth(70),
              height: getProportionateScreenWidth(70),
              child: Icon(
                newIcon,
                color: Colors.white,
                size: getProportionateScreenWidth(40.0),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(40)),
            child: Text(
              "$newTitle",
              style: regularTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
