import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class CustomSwiper extends StatelessWidget {
  final  model ;

  const CustomSwiper({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              model[index],
              fit: BoxFit.fill,
            ));
      },
      itemCount: model.length,
      itemWidth: MediaQuery.of(context).size.width,
      viewportFraction: 0.8,
      scale: 0.85,
      autoplay: true,
      loop: true,
    );
  }
}
