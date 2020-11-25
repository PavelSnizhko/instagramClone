import 'package:flutter/material.dart';
import 'package:my_instagram/models/comment_model.dart';
import 'package:my_instagram/models/feed.dart';
import 'package:my_instagram/models/post_model.dart';
import 'package:my_instagram/models/user_model.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:my_instagram/widgets/stories.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatelessWidget {
  final int id;
  const CommentPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel post = Provider.of<PostModel>(context);
    User user = Provider.of<User>(context).getFriendById(post.userId);
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text("Comments"),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // Todo adressing to message
              })
        ],
      ),
      body: Column(children: [
        Row(children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: StoryIcon(
              true,
              id: id,
              height: 50,
              width: 50,
              radius: 30,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, top: 30, bottom: 10),
              child: Post.buildDescription(
                  context, user.nickname, post.description)),
        ]),
        Divider(
          color: Colors.white,
        ),
        post.comments.length != 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: post.comments.length,
                itemBuilder: (context, index) {
                  return Text(post.comments[index].commentText);
                })
            : Container(),
        TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Add your comment',
              suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    var message = nameController.text;
                    if (message != '') {
                      post.addComment(
                          Comment(user.id, message, post.id, user.id));
                    }
                  }),
            ))
      ]),
    );
  }
}
