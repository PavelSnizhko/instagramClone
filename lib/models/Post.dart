import 'package:my_instagram/models/Comment.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:flutter/foundation.dart';

class PostModel with ChangeNotifier {
  final int id;
  final String nickname;
  final String userAvatar;
  final String mainPhotoUrl;
  final String description;
  final String userPhoto;
  bool like = false;
  List<Comment> comments = [];
  int likesCount = 0;
  bool archive = false;

  PostModel(
      {this.id,
      this.nickname,
      this.userAvatar,
      this.mainPhotoUrl,
      this.description,
      this.userPhoto});

  void changeLikeStatus() {
    this.like = !(this.like);
    if (this.like)
      incrementLikes();
    else
      decrementLikes();
    notifyListeners();
  }

  void changeArchiveStatus() {
    this.archive = !(this.archive);
    notifyListeners();
  }

  void incrementLikes() {
    likesCount++;
  }

  void decrementLikes() {
    likesCount--;
  }

  void addComment(Comment comment) {
    comments.add(comment);
    notifyListeners();
  }
}
