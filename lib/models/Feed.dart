import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:my_instagram/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedModelProvider with ChangeNotifier {
  final List<PostModel> _posts = [
    PostModel(
      id: 0,
      mainPhotoUrl:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      nickname: "lorem_ipsum",
      userAvatar:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      description: "Lorem Ipsum is simply dummy",
      userPhoto:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    ),
    PostModel(
      id: 1,
      mainPhotoUrl:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      nickname: "lorem_ipsum",
      userAvatar:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      description: "Lorem Ipsum is simply dummy",
      userPhoto:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    ),
    PostModel(
      id: 2,
      mainPhotoUrl:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      nickname: "jsfdklfsd_fd",
      userAvatar:
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      description: "Lorem Ipsum is simply dummy",
      userPhoto:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    ),
  ];
  final List<PostModel> _favoritePosts = [];

  void add(PostModel post) {
    _posts.add(post);
    notifyListeners();
  }

  void addToArchive(PostModel post) {
    _favoritePosts.add(post);
    notifyListeners();
  }

  UnmodifiableListView<PostModel> get posts => UnmodifiableListView(_posts);

  PostModel getElementById(int id) =>
      _posts.singleWhere((value) => value.id == id);

  /// Removes all items from the cart.
}
