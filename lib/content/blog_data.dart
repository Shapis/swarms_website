import 'package:flutter/material.dart';
import 'package:minimal/content/blogs/elections_2020_accusations.dart';

class BlogEntry {
  final String title;
  final String description;
  final String imageAddress;
  final String authorThoughts;
  final List<String> tags;
  final List<Widget> blogBody;

  BlogEntry({
    this.tags,
    this.blogBody,
    this.authorThoughts,
    @required this.imageAddress,
    @required this.title,
    @required this.description,
  });
}

class BlogData {
  final List<BlogEntry> myList = [
    BlogEntry(
        blogBody: BlogElections2020.blogBody,
        //authorThoughts: 'This story is super dope',
        title:
            'A note on accusations of fraud in the United State\'s 2020 Presidential Election',
        imageAddress: 'assets/images/voting.png',
        description:
            'A note on accusations of fraud in the United State\'s 2020 Presidential Election I think it should be said that claims of fraud in the presidential election should be taken extremely seriously. The only proper response...'),
  ];
}
