import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
class CustomSwiper extends StatelessWidget {
  final  model ;

  const CustomSwiper({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return CustomNetworkImage().containerNewWorkImage(
          image: model[index],
          height: 200,
          radius: 20,
          width: MediaQuery.of(context).size.width
        );
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
