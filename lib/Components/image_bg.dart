  import 'package:flutter/material.dart';

class ImageBG extends StatelessWidget {
  final image ;

  const ImageBG({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image ?? "assets/images/bg_app.png",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
