import 'dart:ui';

import 'package:flutter/material.dart';

import 'loader.component.dart';


class BlockingLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFE5E5E5).withOpacity(0.4),
        alignment: Alignment.center,
        child: Container(
          height: 80.0,
          width: 80.0,
          child: AppLoader(),
        ),
      ),
    );
  }
}
