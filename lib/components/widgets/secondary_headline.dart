import 'package:flutter/material.dart';
import 'package:minimal/components/text.dart';

class SecondaryHeadline extends StatelessWidget {
  final String text;
  const SecondaryHeadline(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextHeadlineSecondary(text: text),
    );
  }
}
