import 'package:flutter/material.dart';
import 'package:my_instagram/models/Comment.dart';
import 'package:my_instagram/models/Feed.dart';
import 'package:my_instagram/models/Post.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatelessWidget {
  final int id;
  const CommentPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<FeedModelProvider>(
        builder: (context, post, child) {
          var postById = post.getElementById(id);
          print(postById.comments);
          return Column(children: [
            postById.comments.length != 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: postById.comments.length,
                    itemBuilder: (context, index) {
                      return Text(postById.comments[index].comment);
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
                          postById.addComment(Comment(message));
                        }
                      }),
                ))
          ]);
        },
      ),
    );
  }
}
