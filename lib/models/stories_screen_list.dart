import 'package:flutter/material.dart';
import 'package:minimal/components/blog.dart';
import 'package:minimal/content/stories_data.dart';
import 'package:minimal/screens/post_screen.dart';

class StoriesScreenList {
  List<Widget> storiesScreen = [];

  List<Widget> getStoriesList(BuildContext context) {
    for (var story in StoriesData().myList) {
      storiesScreen.add(ListItem(
        imageUrl: story.imageAddress,
        title: story.title,
        description: story.description,
        onButtonPressed: (story.storyBody != null)
            ? () {
                List<Widget> startOfTheList = [
                  ImageWrapper(
                    image: story.imageAddress,
                  )
                ];
                List<Widget> endOfTheList = [];

                if (story.authorThoughts != null) {
                  endOfTheList = [
                    ...authorSection(
                        imageUrl: "assets/images/tyler-hauth2.png",
                        name: "Author Thoughts",
                        bio: story.authorThoughts),
                  ];
                }

                var sumOfLists =
                    startOfTheList + story.storyBody + endOfTheList;

                Navigator.pushNamed(context, PostScreen.id,
                    arguments: sumOfLists);
              }
            : null,
      ));
    }
    return storiesScreen;
  }
}
