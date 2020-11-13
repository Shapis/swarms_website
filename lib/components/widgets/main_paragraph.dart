import 'package:flutter/material.dart';

import '../text.dart';

class MainParagraph extends StatelessWidget {
  final String text;
  const MainParagraph(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextBody(text: text),
    );
  }
}
