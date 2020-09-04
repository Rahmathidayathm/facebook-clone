import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer({
    this.currentUser
  });

  @override
  Widget build(BuildContext context) {
    print(currentUser.imageUrl);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[700],
                backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'What\'s on your mind?'),
                ),
              ),
            ],
          ),
          Divider(height: 10.0, thickness:  0.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                onPressed: () => print('Live'),
                icon: Icon(Icons.videocam),
                label: Text('Live'),
              ),
              VerticalDivider(width: 8.0,),
              FlatButton.icon(
                onPressed: () => print('Photo'),
                icon: Icon(Icons.photo_library, color: Colors.green,),
                label: Text('Live'),
              ),
              VerticalDivider(width: 8.0,),
              FlatButton.icon(
                onPressed: () => print('Room'),
                icon: Icon(Icons.video_call, color: Colors.purple,),
                label: Text('Room'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
