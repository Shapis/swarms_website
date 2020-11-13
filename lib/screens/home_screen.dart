import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';
import 'package:minimal/content/home_screen_data.dart';
import 'package:minimal/screens/base_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(child: [
      ListItem(
        imageUrl: 'assets/images/swarmsidiot.jpg',
        title: HomeScreenData.title,
        description: HomeScreenData.description,
        // onButtonPressed: () {
        //   print('abc');
        // },
      )
    ]);
  }
}
