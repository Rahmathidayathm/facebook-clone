import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/circle_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text('facebook', style: TextStyle(color: Palette.facebookBlue,fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -1.2),),
            floating: true,
            actions: [
              CircleButton(icon: Icons.search, iconSize: 28.0, onPressed: () { print('search'); },),
              CircleButton(icon: Icons.camera_alt, iconSize: 28.0, onPressed: () { print('camera'); },)
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              child: CreatePostContainer(currentUser: currentUser),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,8.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers,),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories)
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length
            )
          )
        ],
      ),
    );
  }
}
