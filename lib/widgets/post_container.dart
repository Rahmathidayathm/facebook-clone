import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({
    this.post
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      child: Column(
        children: [
          _PostHeader(post: post),
          SizedBox(height: 5.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(post.caption),
              ),
              post.imageUrl != null ? CachedNetworkImage(imageUrl: post.imageUrl, fit: BoxFit.cover) : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25.0,
                          width: 25.0,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.facebookBlue,
                          ),
                          child: Icon(Icons.thumb_up, color: Colors.white, size: 20.0),
                        ),
                        SizedBox(width: 4.0,),
                        Text('${post.likes}', style: TextStyle(color: Colors.grey[600]),)
                      ],
                    ),
                    Row(
                      children: [
                        Text('${post.comments} Comments', style: TextStyle(color: Colors.grey[600])),
                        SizedBox(width: 6.0),
                        Text('${post.comments} Comments', style: TextStyle(color: Colors.grey[600])),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(thickness: 1, height: 4,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.thumb_up),
                    label: Text('Like'),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.add_comment),
                    label: Text('Comment'),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.share),
                    label: Text('Share'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  _PostHeader({
    this.post
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: CachedNetworkImageProvider(post.user.imageUrl)
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.user.name),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('${post.timeAgo} . ', style: TextStyle(fontSize: 13.0, color: Colors.grey[600]),),
                      Icon(Icons.public, size: 15.0,)
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black,),
            onPressed: () => print('more'),
          )
        ],
      ),
    );
  }
}
