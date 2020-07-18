import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage{
  Widget circleNewWorkImage(String image){
    return  CachedNetworkImage(
      imageUrl: image == null ? "" : image,
      fadeInDuration: Duration(seconds: 2),
      placeholder: (context, url) => CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/avatar.jpeg",
        ),),
      imageBuilder: (context, provider) {
        return CircleAvatar(
          backgroundImage: provider,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}