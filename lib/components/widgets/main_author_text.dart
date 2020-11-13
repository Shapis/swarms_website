import 'package:flutter/material.dart';
import 'package:minimal/components/text.dart';

class MainAuthorText extends StatelessWidget {
  final String text;
  const MainAuthorText(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextBodySecondary(text: text),
    );
  }
}
