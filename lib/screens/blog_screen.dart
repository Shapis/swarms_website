import 'package:flutter/material.dart';
import 'package:minimal/models/blog_screen_list.dart';
import 'package:minimal/screens/base_screen.dart';

class BlogScreen extends StatelessWidget {
  static const String id = 'blog_screen';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: BlogScreenList().getBlogList(context),
    );
  }
}
