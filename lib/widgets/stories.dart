import 'package:flutter/material.dart';

class StoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Stack(children: [
          StoryIcon(
            url:
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
            isActive: false,
            userName: 'snizhko',
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
        StoryIcon(
          url:
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
          isActive: true,
          userName: 'oooooo1k',
          width: 70,
          height: 70,
          radius: 50,
        ),

        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.red, Colors.orange],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //     borderRadius: BorderRadius.all(Radius.circular(100)),
        //   ),
        // ),
        StoryIcon(
            url:
                "https://i.pinimg.com/236x/dd/64/74/dd6474beaaa197bd7e1bac3d16d39afe.jpg",
            isActive: true,
            userName: 'pavel_snizhko',
            width: 70,
            height: 70,
            radius: 50),
        StoryIcon(
          url:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          isActive: true,
          userName: 'oooooo1k',
          width: 70,
          height: 70,
          radius: 50,
        ),
        StoryIcon(
          url:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          isActive: true,
          userName: 'jdfjs_fk',
          width: 70,
          height: 70,
          radius: 50,
        ),
        StoryIcon(
          url:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          isActive: true,
          userName: 'joj_4',
          width: 70,
          height: 70,
          radius: 50,
        ),
        StoryIcon(
          url:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          isActive: true,
          userName: 'joj_4',
          width: 70,
          height: 70,
          radius: 50,
        ),
        StoryIcon(
          url:
              "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          isActive: true,
          userName: 'joj_4',
          width: 70,
          height: 70,
          radius: 50,
        ),
      ],
    );
  }
}

class StoryIcon extends StatefulWidget {
  final String url;
  bool isActive;
  final String userName;
  final double width;
  final double height;
  final double radius;

  StoryIcon(
      {Key key,
      this.url,
      this.isActive,
      this.userName = '',
      this.height,
      this.width,
      this.radius})
      : super(key: key);

  @override
  _StoryIconState createState() => _StoryIconState();
}

class _StoryIconState extends State<StoryIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: widget.userName != ''
            ? EdgeInsets.only(left: 15, top: 10)
            : EdgeInsets.only(left: 15),
        width: widget.width,
        height: widget.height,
        decoration: (widget.isActive == true)
            ? BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.url),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(new Radius.circular(widget.radius)),
                border: Border.all(width: 4.0, color: Colors.red),
              )
            : BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.url),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(new Radius.circular(widget.radius)),
              ),
      ),
      widget.userName != ''
          ? Padding(
              padding: EdgeInsets.only(left: 18), child: Text(widget.userName))
          : Padding(padding: EdgeInsets.only(left: 18)),
    ] // border: Border.all(width: 4.0, color: Colors.red),
        );
  }
}

// class MyClass extends StoryIcon{
//   final
// }
