import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: FlareActor(
        "assets/animations/loading.flr",
        alignment: Alignment.center,
        fit: BoxFit.fill,
        animation: "shuffle",
      ),
    );
  }
}
