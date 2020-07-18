import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomVisibility extends StatelessWidget {
  final bool loading;

  const CustomVisibility({Key key, this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: loading ?? true,
        child: Center(
            child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ))));
  }
}
