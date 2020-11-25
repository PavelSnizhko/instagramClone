import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_instagram/models/feed.dart';
import 'package:my_instagram/models/user_model.dart';
// import 'package:my_instagram/pages/home_page.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/post_model.dart';
import 'models/story_model.dart';

//Temporary for new stories then get from http
void addTestStories(StoriesFeed feed) {
  feed.addStories(
      1,
      StoryModel(
        1,
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        '',
        1,
      ));
  feed.addStories(
      2,
      StoryModel(
        2,
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        '',
        2,
      ));
}

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<User>(
          create: (context) => User(
              0,
              "snizhko",
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
              0),
        ),
        ChangeNotifierProvider<FeedModel>(
          create: (context) => FeedModel(0, 0),
        ),
        ChangeNotifierProvider<StoriesFeed>(create: (context) {
          StoriesFeed storyFeed = StoriesFeed(0, 0);
          addTestStories(storyFeed);
          return storyFeed;
        })
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "My implementation",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              // tooltip: 'Show Snackbar',
              onPressed: () {
                Text("Заглушка");
              },
              color: Colors.black,
              iconSize: 30,
            ),
            Text(
              "Instagram",
              style: GoogleFonts.lobster(fontSize: 25),
            ),
            Transform.rotate(
                angle: -35 * pi / 180,
                child: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  // tooltip: 'Show Snackbar',
                  onPressed: () {},
                  color: Colors.black,
                )),
          ],
        ),
      ),
      body: Feed(),
    );
  }
}
