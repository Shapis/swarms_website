import 'package:flutter/material.dart';
import 'package:minimal/screens/base_screen.dart';

class PostScreen extends StatelessWidget {
  static const String id = 'post_screen';

  @override
  Widget build(BuildContext context) {
    final List<Widget> child =
        ModalRoute.of(context).settings.arguments as List<Widget>;

    return BaseScreen(child: child);
  }
}
