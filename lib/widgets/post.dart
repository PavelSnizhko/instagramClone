import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_instagram/models/Feed.dart';
import 'package:my_instagram/models/Post.dart';
import 'package:my_instagram/pages/comment_page.dart';

import 'stories.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';

// class Post extends StatelessWidget {
//   final int id;

//   Post({Key key, this.id}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final post = context.read<FeedModelProvider>().getElementById(id);

//     return Consumer<FeedModelProvider>(builder: (context, post, child) {
//       final postId = post.getElementById(id);
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 50,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(children: [
//                   StoryIcon(
//                     url: postId.userAvatar,
//                     isActive: false,
//                     height: 50,
//                     width: 50,
//                     radius: 30,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 12),
//                     child: Text(postId.nickname,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 15)),
//                   ),
//                 ]),
//                 Padding(
//                   padding: EdgeInsets.only(right: 20),
//                   child: Icon(
//                     Icons.more_horiz,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10, bottom: 10),
//             width: double.infinity,
//             child: Image(
//               image: NetworkImage(postId.mainPhotoUrl),
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           Container(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           Icons.favorite,
//                           color: postId.like ? Colors.red : Colors.white,
//                           size: 25,
//                         ),
//                         onPressed: () {
//                           postId.changeLikeStatus();
//                           print(postId.id);
//                           print(postId.like);
//                           // scaffoldKey.currentState.showSnackBar(snackBar);
//                         },
//                         // tooltip: 'Show Snackbar',

//                         color: Colors.black,
//                       ),
//                       Icon(
//                         CupertinoIcons.chat_bubble,
//                         size: 35,
//                       ),
//                       Transform.rotate(
//                         angle: -24 * pi / 180,
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.send,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           // tooltip: 'Show Snackbar',
//                           onPressed: () {
//                             Text("Заглушка");
//                             // scaffoldKey.currentState.showSnackBar(snackBar);
//                           },
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 10),
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.archive_outlined,
//                         color: postId.archive ? Colors.grey : Colors.white,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         postId.changeArchiveStatus();
//                       },
//                     ),
//                   )
//                 ]),
//           ),
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 6, left: 15),
//               child: Text(
//                 ("77 likes"),
//                 textAlign: TextAlign.left,
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 6, left: 15),
//               child: Row(
//                 children: [
//                   Text(
//                     postId.nickname,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   SizedBox(width: 8.0),
//                   Flexible(
//                     child: Text(
//                       postId.description,
//                       style: TextStyle(fontSize: 15.0),
//                       overflow: TextOverflow.clip,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               child: Text(
//                 "View all 2 comments",
//                 style: TextStyle(color: Colors.grey, fontSize: 16),
//               ),
//               padding: EdgeInsets.only(bottom: 0, left: 15),
//             ),
//             Row(children: [
//               // !- TODO: replace StoryIcon data to model
//               StoryIcon(
//                 url: postId.userPhoto,
//                 isActive: false,
//                 height: 30,
//                 width: 30,
//                 radius: 40,
//               ),
//               SizedBox(
//                 width: 300,
//                 child: TextField(
//                     decoration: InputDecoration(
//                   hintText: 'Add comment',
//                   border: InputBorder.none,
//                   contentPadding:
//                       EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
//                 )),
//               )
//             ]),
//             Padding(
//                 padding: EdgeInsets.only(bottom: 6, left: 15),
//                 child: Text(
//                   "31 minutes ago",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 )),
//           ]),
//           SizedBox(
//             height: 10,
//           )
//         ],
//       );
//     });
//   }
// }

class Post extends StatelessWidget {
  final int id;

  Post({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final post = context.read<FeedModelProvider>().getElementById(id);
    final post = Provider.of<FeedModelProvider>(context, listen: false);
    final postId = post.getElementById(id);
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
                  true,
                  id: id,
                  height: 50,
                  width: 50,
                  radius: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(postId.nickname,
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
            width: double.infinity,
            child: InkWell(
              onDoubleTap: () {
                postId.changeLikeStatus();
              },
              child: Image(
                image: NetworkImage(postId.mainPhotoUrl),
                fit: BoxFit.fitWidth,
              ),
            )),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<FeedModelProvider>(builder: (context, post, child) {
                  final post_Id = post.getElementById(id);
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: post_Id.like ? Colors.red : Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      post_Id.changeLikeStatus();
                      // scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                    // tooltip: 'Show Snackbar',

                    color: Colors.black,
                  );
                }),
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
                  color: postId.archive ? Colors.grey : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  postId.changeArchiveStatus();
                },
              ),
            )
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 6, left: 15),
            child: Text(
              ("${postId.likesCount} likes"),
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6, left: 15),
            child: Row(
              children: [
                Text(
                  postId.nickname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    postId.description,
                    style: TextStyle(fontSize: 15.0),
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
          ),
          Padding(
            child: GestureDetector(
              child: Text(
                "View all ${postId.comments.length} comments",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CommentPage(
                            id: postId.id,
                          )),
                );
              },
            ),
            padding: EdgeInsets.only(bottom: 0, left: 15),
          ),
          Row(children: [
            // !- TODO: replace StoryIcon data to model
            StoryIcon(
              true,
              id: id,
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

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsData = context.watch<FeedModelProvider>();
    print(postsData.posts);
    print("Here ");
    return Container(
        child: ListView(scrollDirection: Axis.vertical,
            // mainAxisSize: MainAxisSize.min,
            children: [
          SizedBox(
            height: 100,
            child: StoriesList(),
          ),
          Divider(
            color: Colors.white,
          ),
          ...postsData.posts.map((e) {
            return Post(id: e.id);
          }).toList()
        ]));
  }
}
