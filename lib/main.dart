import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_instagram/models/Feed.dart';
// import 'package:my_instagram/pages/home_page.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_instagram/widgets/stories.dart';
import 'package:my_instagram/widgets/message.dart';
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Story.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<FeedModelProvider>(
        create: (context) => FeedModelProvider(),
      ),
      ChangeNotifierProvider<StoriesFeed>(
        create: (context) => StoriesFeed(),
      )
    ], child: MyApp()));

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
