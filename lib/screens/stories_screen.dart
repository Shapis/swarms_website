import 'package:flutter/material.dart';
import 'package:minimal/content/stories_screen_list.dart';
import 'package:minimal/screens/base_screen.dart';

class StoriesScreen extends StatelessWidget {
  static const String id = 'stories_screen';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: StoriesScreenList().getStoriesList(context),
    );
  }
}
