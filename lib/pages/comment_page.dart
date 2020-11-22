import 'package:flutter/material.dart';
import 'package:my_instagram/models/Comment.dart';
import 'package:my_instagram/models/Feed.dart';
import 'package:my_instagram/models/Post.dart';
import 'package:my_instagram/widgets/post.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatelessWidget {
  final int id;
  const CommentPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel post = Provider.of<PostModel>(context);
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
        post.comments.length != 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: post.comments.length,
                itemBuilder: (context, index) {
                  return Text(post.comments[index].comment);
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
                      post.addComment(Comment(message));
                    }
                  }),
            ))
      ]),
    );
  }
}
