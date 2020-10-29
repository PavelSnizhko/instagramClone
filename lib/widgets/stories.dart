import 'package:flutter/material.dart';
import 'package:my_instagram/models/Feed.dart';
import 'package:my_instagram/models/Story.dart';
import 'package:my_instagram/pages/story_page.dart';
import 'package:provider/provider.dart';

class StoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stories = Provider.of<StoriesFeed>(context).stories;
    print(stories);
    return ListView(
      // physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Stack(children: [
          StoryIcon(
            false,
            id: 0,
            width: 70,
            height: 70,
            radius: 50,
          ),
          Positioned(
            left: 60,
            bottom: 15,
            child: Icon(
              Icons.add_circle,
              size: 20,
            ),
          ),
        ]),
        Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: stories.length,
            itemBuilder: (context, index) => Hero(
              tag: stories[index].id,
              child: GestureDetector(
                child: StoryIcon(
                  false,
                  id: index,
                  width: 70,
                  height: 70,
                  radius: 50,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => StoryPage(id: index)),
                  );
                },
              ),
            ),
          ),
        )
        // itemBuilder: (context, index) => Hero(
        //   tag: stories.[index].imgUrl,
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => ItemPage(
        //           productId: cartItems.keys.toList()[index],
        //         ),),
        //       );

        // StoryIcon(
        //   url:
        //       "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        //   isActive: true,
        //   userName: 'oooooo1k',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),

        // //   decoration: BoxDecoration(
        // //     gradient: LinearGradient(
        // //       colors: [Colors.red, Colors.orange],
        // //       begin: Alignment.topCenter,
        // //       end: Alignment.bottomCenter,
        // //     ),
        // //     borderRadius: BorderRadius.all(Radius.circular(100)),
        // //   ),
        // // ),
        // StoryIcon(
        //     url:
        //         "https://i.pinimg.com/236x/dd/64/74/dd6474beaaa197bd7e1bac3d16d39afe.jpg",
        //     isActive: true,
        //     userName: 'pavel_snizhko',
        //     width: 70,
        //     height: 70,
        //     radius: 50),
        // StoryIcon(
        //   url:
        //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        //   isActive: true,
        //   userName: 'oooooo1k',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),
        // StoryIcon(
        //   url:
        //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        //   isActive: true,
        //   userName: 'jdfjs_fk',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),
        // StoryIcon(
        //   url:
        //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        //   isActive: true,
        //   userName: 'joj_4',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),
        // StoryIcon(
        //   url:
        //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        //   isActive: true,
        //   userName: 'joj_4',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),
        // StoryIcon(
        //   url:
        //       "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        //   isActive: true,
        //   userName: 'joj_4',
        //   width: 70,
        //   height: 70,
        //   radius: 50,
        // ),
      ],
    );
  }
}

class StoryIcon extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final int id;
  bool isForPost = false;

  StoryIcon(this.isForPost,
      {Key key, this.height, this.width, this.radius, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoriesFeed>(builder: (context, story, child) {
      final storyById = story.getElementById(id);
      return Column(
        children: [
          Container(
            margin: !isForPost
                ? EdgeInsets.only(left: 15, top: 10)
                : EdgeInsets.only(left: 15),
            width: width,
            height: height,
            decoration: (storyById.active == true)
                ? BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(storyById.userAvatar),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(new Radius.circular(radius)),
                    border: Border.all(width: 4.0, color: Colors.red),
                  )
                : BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(storyById.userAvatar),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(new Radius.circular(radius)),
                  ),
          ),
          !isForPost
              ? Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(storyById.nickname))
              : Padding(padding: EdgeInsets.only(left: 18)),
        ], // border: Border.all(width: 4.0, color: Colors.red),
      );
    });
  }
}

// class MyClass extends StoryIcon{
//   final
// }
