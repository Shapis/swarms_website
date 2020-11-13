import 'package:flutter/material.dart';
import 'package:minimal/content/stories/summer_boy.dart';

class StoryEntry {
  final String title;
  final String description;
  final String imageAddress;
  final String authorThoughts;
  final List<String> tags;
  final List<Widget> storyBody;

  StoryEntry({
    this.tags,
    this.storyBody,
    this.authorThoughts,
    @required this.imageAddress,
    @required this.title,
    @required this.description,
  });
}

class StoriesData {
  final List<StoryEntry> myList = [
    StoryEntry(
        //storyBody: [],
        //authorThoughts: 'This story is super dope',
        title: 'The Malice',
        imageAddress: 'assets/images/the-malice-cover.jpg',
        description:
            'There’s a monster in the woods that surround the little city of Dent that grinds its teeth on young white bones and craves boy flesh. For as long as anyone in Dent can remember, two boys have gone missing from town every summer. Not for a generation, but for centuries—and for the boys that live in the city, the way the adults are resigned to this way of life is as horrible as the terror that’s stealing their friends. When Michael decides to penetrate the dense Ozark Mountain’s with his dog, Gus, he’s determined to uncover the truth about what’s been feasting on the city since long before his great grandpa moved there. What he discovers makes the Lovecraftian horror tales he reads in secret look like Dr. Seuss chapter books.'),
    StoryEntry(
        authorThoughts: 'This story is super dope',
        title: 'The Storm Seller',
        imageAddress: 'assets/images/the-storm-seller-cover.jpg',
        description:
            'Described by one editor as "wickedly Faustian" and "chilling to consider," The Storm Seller is perhaps Hauth\'s best work. Here he mixes magical realism with horror and the result is a picture of two boys that sacrifice more than they could ever know to spend a single day together in the sun.\nIf the Storm Seller were reversed, perhaps it would not be so riveting. How many 80-year-old men would trade a fortune to be twelve again, even just for one day, and have a long, full, sunny day to play with their best friend? But of course, at twelve, Harvey and Stephen don\'t have a fortune to offer the Storm Seller.\nAll they have is their youth.\nAnd the Storm Seller would like nothing more than to steal it.'),
    StoryEntry(
        authorThoughts:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        storyBody: StorySummerBoy.storyBody,
        title: 'Summer Boy',
        imageAddress: 'assets/images/summer-boy-cover.jpg',
        description:
            'Summer Boy is deeply poignant and shockingly impactful. One reader remarked that it was the best thing they read all year.\nIt\'s a short story of a boy who wants to get the most out of his last day of summer vacation--even if that means breaking the rules and going to the lake alone. ')
  ];
}
