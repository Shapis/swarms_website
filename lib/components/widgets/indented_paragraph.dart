import 'package:flutter/material.dart';
import 'package:minimal/components/text.dart';

class IndentedParagraph extends StatelessWidget {
  final String text;
  const IndentedParagraph(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBlockquote(text: text);
  }
}
