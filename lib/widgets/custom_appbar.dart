import 'package:flutter/material.dart';
import 'package:helping_hands_v2/constants/constants.dart';
import 'package:helping_hands_v2/size_config.dart';

// ignore: camel_case_types
class Custom_AppBar extends StatelessWidget {
  final String? title;
  final bool? isCenterTitle, isTitle;
  final List<Widget>? actions;

  const Custom_AppBar({this.title, this.isCenterTitle, this.isTitle, this.actions});

  @override
  Widget build(BuildContext context) {
    bool isTitleLocal = isTitle ?? true;
    bool isCenterTitleLocal = isCenterTitle ?? false;

    return AppBar(
      title: isTitleLocal ? Text(title!) : Text("ACTION BAR"),
      centerTitle: isCenterTitleLocal,
      actions: actions!,
    );
  }
}
