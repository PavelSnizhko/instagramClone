import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_size_getter/file_input.dart';

import 'stories.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:io';

import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';

class Post extends StatefulWidget {
  String nickname;
  String userAvatar;
  String mainPhotoUrl;
  String comment;
  String userPhoto;

  Post(
      {Key key,
      this.nickname,
      this.userAvatar,
      this.mainPhotoUrl,
      this.comment,
      this.userPhoto})
      : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool like;
  bool archive;

  _PostState() {
    like = false;
    archive = false;
  }

  void _toggleFavorite() {
    setState(() {
      if (like)
        like = false;
      else
        like = true;
    });
  }

  void _toggleArchive() {
    setState(() {
      if (archive)
        archive = false;
      else
        archive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                StoryIcon(
                  url: widget.userAvatar,
                  isActive: false,
                  height: 50,
                  width: 50,
                  radius: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(this.widget.nickname,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.more_horiz,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          // TODO: soulution to get height of image from network
          // height: ImageSizeGetter.getSize(FileInput(File(widget.mainPhotoUrl)))
          //     .height
          //     .roundToDouble(),
          width: double.infinity,
          child: Image(
            image: NetworkImage(this.widget.mainPhotoUrl),
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: like ? Colors.red : Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    this._toggleFavorite();
                    // scaffoldKey.currentState.showSnackBar(snackBar);
                  },
                  // tooltip: 'Show Snackbar',

                  color: Colors.black,
                ),
                Icon(
                  CupertinoIcons.chat_bubble,
                  size: 35,
                ),
                Transform.rotate(
                  angle: -24 * pi / 180,
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                    // tooltip: 'Show Snackbar',
                    onPressed: () {
                      Text("Заглушка");
                      // scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.archive_outlined,
                  color: archive ? Colors.grey : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  this._toggleArchive();
                },
              ),
            )
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 6, left: 15),
            child: Text(
              ("77 likes"),
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6, left: 15),
            child: Row(
              children: [
                Text(
                  widget.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    widget.comment,
                    style: TextStyle(fontSize: 15.0),
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
          ),
          Padding(
            child: Text(
              "View all 2 comments",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            padding: EdgeInsets.only(bottom: 0, left: 15),
          ),
          Row(children: [
            StoryIcon(
              url: widget.userPhoto,
              isActive: false,
              height: 30,
              width: 30,
              radius: 40,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                  decoration: InputDecoration(
                hintText: 'Add comment',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              )),
            )
          ]),
          Padding(
              padding: EdgeInsets.only(bottom: 6, left: 15),
              child: Text(
                "31 minutes ago",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )),
        ]),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
