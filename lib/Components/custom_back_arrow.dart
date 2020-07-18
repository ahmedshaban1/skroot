import 'package:flutter/material.dart';
class CustomBackArrow extends StatelessWidget {
  final color ;
  final left ;
  final right ;
  final icon ;
  final top ;
  final bottom ;
  final iconColor ;
  final onTap ;

  const CustomBackArrow({Key key, this.color, this.left, this.right, this.icon, this.top, this.bottom, this.iconColor, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: top ?? 10.0,
      left: left ?? 10.0,
      child: InkWell(
        onTap: onTap,
          child: Icon(icon ?? Icons.arrow_back , color: iconColor ?? Colors.white,)),
    );
  }
}
