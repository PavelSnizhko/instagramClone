import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:my_instagram/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:my_instagram/models/user_model.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:provider/provider.dart';

class FeedModel with ChangeNotifier {
  final int id;
  final userId;

  FeedModel(this.id, this.userId);

  final Map<int, List<PostModel>> feed = {
    1: [
      PostModel(
          id: 1,
          mainPhotoUrl:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          description: "Lorem Ipsum is simply dummy valera_ok",
          userId: 1),
      PostModel(
          id: 2,
          mainPhotoUrl:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          description: "Lorem Ipsum is simply dummy valera_ok_2",
          userId: 1)
    ],
    2: [
      PostModel(
          id: 3,
          mainPhotoUrl:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          description: "This is post for my friend.I'm  tttt_2",
          userId: 2),
      PostModel(
          id: 4,
          mainPhotoUrl:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          description: "This is my second  post. I'm  tttt_2",
          userId: 2),
    ]
  };

  int getCountOfPosts() {
    int count = 0;
    for (var listOfPost in this.feed.values.toList()) {
      count += listOfPost.length;
    }
    return count;
  }

  List getAllPosts() {
    List<PostModel> posts = [];
    for (var listOfPost in this.feed.values.toList()) {
      for (PostModel post in listOfPost) {
        posts.add(post);
      }
    }
    return posts;
  }

  void addItem(int id, PostModel post) {
    feed.putIfAbsent(id, () => List<PostModel>.generate(1, (index) => post));
  }

  // PostModel(
  //   id: 0,
  //   mainPhotoUrl:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   nickname: "lorem_ipsum",
  //   userAvatar:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   description:
  //       "Lorem Ipsum is simply dummy but not yamy. Hey, you! Yes you. Get out of here.",
  //   userPhoto:
  //       "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  // ),
  // PostModel(
  //   id: 1,
  //   mainPhotoUrl:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   nickname: "lorem_ipsum",
  //   userAvatar:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   description: "Lorem Ipsum is simply dummy",
  //   userPhoto:
  //       "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  // ),
  // PostModel(
  //   id: 2,
  //   mainPhotoUrl:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   nickname: "jsfdklfsd_fd",
  //   userAvatar:
  //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  //   description: "Lorem Ipsum is simply dummy",
  //   userPhoto:
  //       "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  // ),
  // final List<PostModel> _favoritePosts = [];

  // void add(PostModel post) {
  //   _posts.add(post);
  //   notifyListeners();
  // }

  // void addToArchive(PostModel post) {
  //   _favoritePosts.add(post);
  //   notifyListeners();
  // }

  // UnmodifiableListView<PostModel> get posts => UnmodifiableListView(_posts);

  // PostModel getElementById(int id) =>
  //     _posts.singleWhere((value) => value.id == id);

  /// Removes all items from the cart.
}
