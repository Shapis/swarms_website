import 'package:flutter/material.dart';
import '../spacing.dart';
import '../typography.dart';

class MainHeadline extends StatelessWidget {
  final String text;
  const MainHeadline(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: marginBottom12,
        child: Text(
          text,
          style: headlineTextStyle,
        ),
      ),
    );
  }
}
