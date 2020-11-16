import 'package:flutter/material.dart';
import 'package:minimal/components/blog.dart';
import 'package:minimal/content/blog_data.dart';
import 'package:minimal/content/stories_data.dart';
import 'package:minimal/screens/post_screen.dart';

class BlogScreenList {
  List<Widget> getBlogList(BuildContext context) {
    List<Widget> blogScreen = [];
    for (var blog in BlogData().myList) {
      blogScreen.add(ListItem(
        imageUrl: blog.imageAddress,
        title: blog.title,
        description: blog.description,
        onButtonPressed: (blog.blogBody != null)
            ? () {
                List<Widget> startOfTheList = [
                  ImageWrapper(
                    image: blog.imageAddress,
                  )
                ];
                List<Widget> endOfTheList = [];

                if (blog.authorThoughts != null) {
                  endOfTheList = [
                    ...authorSection(context,
                        imageUrl: "assets/images/tyler-hauth2.png",
                        name: "Author Thoughts",
                        bio: blog.authorThoughts),
                  ];
                }

                var sumOfLists = startOfTheList + blog.blogBody + endOfTheList;

                Navigator.pushNamed(context, PostScreen.id,
                    arguments: sumOfLists);
              }
            : null,
      ));
    }
    return blogScreen;
  }
}
