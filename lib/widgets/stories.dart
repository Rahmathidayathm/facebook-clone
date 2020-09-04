import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories({
    this.currentUser,
    this.stories
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200.0,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if( index == 0 ) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: story
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            height: double.infinity,
            width: 110.0,
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0)
          ),
        ),
        isAddStory ? Positioned(
          top: 8,
          left: 8,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add, color: Palette.facebookBlue,),
              iconSize: 30.0,
            ),
          )
        ): ProfileAvatar(
          imageUrl: story.user.imageUrl,
          hasBorder: true,
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(isAddStory ? currentUser.name : story.user.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
        )
      ],
    );
  }
}

