import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:my_instagram/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryModel with ChangeNotifier {
  int id;
  String nickname;
  String userAvatar;
  String storyPhoto;
  String description;
  bool active = true;

  StoryModel(int id, String nickname, String userAvatar, String storyPhoto,
      String description,
      [bool active]) {
    this.id = id;
    this.nickname = nickname;
    this.userAvatar = userAvatar;
    this.storyPhoto = storyPhoto;
    this.description = description;
    this.active = active;
  }

  void changeState() {
    this.active = !(this.active);
  }
}

class StoriesFeed with ChangeNotifier {
  final List<StoryModel> _stories = [
    StoryModel(
      0,
      'snizhko',
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      1,
      'keke',
      "https://i.pinimg.com/236x/dd/64/74/dd6474beaaa197bd7e1bac3d16d39afe.jpg",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      2,
      '000000k1',
      "https://i.pinimg.com/236x/dd/64/74/dd6474beaaa197bd7e1bac3d16d39afe.jpg",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      3,
      'snizhko',
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      4,
      'qwert000',
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      5,
      'snizhko',
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
    StoryModel(
      6,
      'snizhko',
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      '',
    ),
  ];

  UnmodifiableListView<StoryModel> get stories =>
      UnmodifiableListView(_stories);

  StoryModel getElementById(int id) =>
      _stories.singleWhere((value) => value.id == id);
}
