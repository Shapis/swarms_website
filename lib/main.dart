import 'package:flutter/material.dart';
import 'package:minimal/screens/blog_screen.dart';
import 'package:minimal/screens/contact_screen.dart';
import 'package:minimal/screens/post_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/about_screen.dart';
import 'screens/screens.dart';
import 'screens/stories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        StoriesScreen.id: (context) => StoriesScreen(),
        PostScreen.id: (context) => PostScreen(),
        AboutScreen.id: (context) => AboutScreen(),
        ContactScreen.id: (context) => ContactScreen(),
        BlogScreen.id: (context) => BlogScreen(),
      },
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
    );
  }
}
