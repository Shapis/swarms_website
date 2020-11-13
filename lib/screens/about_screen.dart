import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';
import 'package:minimal/content/about_screen_data.dart';
import 'package:minimal/screens/base_screen.dart';

class AboutScreen extends StatelessWidget {
  static const String id = 'about_screen';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(child: [
      ListItem(
        imageUrl: 'assets/images/tyler-hauth2.jpg',
        title: AboutScreenData.title,
        description: AboutScreenData.description,
        // onButtonPressed: () {
        //   print('abc');
        // },
      )
    ]);
  }
}
