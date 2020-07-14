import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carusel extends StatelessWidget {

  final List img;

  const Carusel({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: MediaQuery.of(context).size.height /4,
      viewportFraction: 0.97,
      aspectRatio: 2.0,
      autoPlay: true,
      initialPage: 1,
      reverse: true,
      enlargeCenterPage: true,
      autoPlayInterval: Duration(seconds: 5),
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 400),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      items: img.map(
        (url) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey ,borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: InkWell(
                onTap: () => showImageDialog( context,url),
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  void showImageDialog( BuildContext context,String image) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoDialog(
            child: Image.network(image),
          );
        });
  }
}
