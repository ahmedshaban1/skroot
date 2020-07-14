import 'package:flutter/material.dart';

class CommonComponents {
  static Widget emptyArea({double height = 0.0, double width = 0.0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget emptyContainer() {
    return Container();
  }
}
