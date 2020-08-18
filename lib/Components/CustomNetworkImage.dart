import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage {

  //Container Network Image with border

  Widget containerNewWorkImage(
      {String image,
        double radius,
        String defaultImage,
        double height,
        double width}) {
    return CachedNetworkImage(
      imageUrl: image == null ? "" : image,
      fadeInDuration: Duration(seconds: 2),
      placeholder: (context, url) => Container(
          width: width ?? 40,
          height: height ?? 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: Image.asset(defaultImage).image))),
      imageBuilder: (context, provider) {
        return Container(
            width: width ?? 40,
            height: height ?? 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(fit: BoxFit.cover, image: provider)));
      },
    );
  }

  // Circle Network Image

  Widget circleNewWorkImage(
      {String image, double radius, String defaultImage}) {
    return CachedNetworkImage(
      imageUrl: image == null ? "" : image,
      fadeInDuration: Duration(seconds: 2),
      placeholder: (context, url) => CircleAvatar(
        radius: radius ?? 20.0,
        backgroundColor: Colors.white,
        backgroundImage: Image.asset(
          defaultImage ?? "assets/images/logo.png",
          fit: BoxFit.cover,
        ).image,
      ),
      imageBuilder: (context, provider) {
        return CircleAvatar(
          backgroundImage: provider,
          radius: radius ?? 20.0,
          backgroundColor: Colors.white,
        );
      },
    );
  }

  //Asset network Image

  Widget imageNewWorkImage(
      {String image, String defaultImage, double height, double width}) {
    return CachedNetworkImage(
      imageUrl: image ?? "",
      fadeInDuration: Duration(seconds: 2),
      placeholder: (context, url) => Container(
          height: height ?? 40,
          width: width ?? 40,
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,
                  image: Image.asset(defaultImage ?? "assets/images/logo.png").image))),
      imageBuilder: (context, provider) {
        return Container(
            height: height ?? 40,
            width: width ?? 40,
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: provider)));
      },
    );
  }
}
