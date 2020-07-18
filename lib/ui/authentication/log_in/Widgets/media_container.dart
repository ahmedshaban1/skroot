import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';
class MediaContainer extends StatelessWidget {
  final onTap ;
  final photo ;

  const MediaContainer({Key key, this.onTap, this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(lightThemeColors["sign-bg"] )
        ),
        child: Center(
          child: Image.asset(photo),
        ),

      ),
    );
  }
}
