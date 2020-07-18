import 'package:flutter/material.dart';

class NavigatorTypes {
  /* final BuildContext context ;
  final Widget widget ;

  NavigatorTypes({this.context ,this.widget});*/

  void changeScreen(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void changeScreenReplacement(BuildContext context, Widget widget) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }
}
