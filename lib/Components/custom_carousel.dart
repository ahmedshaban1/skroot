import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
class CustomCarousel{

  Widget slider(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 160,
        decoration: BoxDecoration(
         color: Colors.white
        ),
        child: Carousel(
          boxFit: BoxFit.contain,
          images: [
            AssetImage("assets/images/fro.jpeg"),
            AssetImage("assets/images/fro.jpeg"),
            AssetImage("assets/images/fro.jpeg"),
            AssetImage("assets/images/fro.jpeg"),
            AssetImage("assets/images/fro.jpeg"),
          ],
          autoplay: false,
          dotSize: 4.0,
          overlayShadow: false,

          noRadiusForIndicator: false,
          showIndicator: true,
          dotIncreasedColor: Theme.of(context).primaryColor,
          dotBgColor: Colors.white,
          dotPosition: DotPosition.bottomCenter,
          dotColor: Colors.grey[300],
          dotIncreaseSize: 2.0,
          dotSpacing: 10.0,
          indicatorBgPadding: 6.0,
          borderRadius: false,

        ),
      ),
    );
  }

}