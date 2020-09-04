import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({
    this.onlineUsers
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if(index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return ProfileAvatar(imageUrl: user.imageUrl, isActive: true,);
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Room Button'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
              child: Icon(Icons.video_call, color: Colors.white, size: 35.0,)
          ),
          SizedBox(width: 4.0,),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}

