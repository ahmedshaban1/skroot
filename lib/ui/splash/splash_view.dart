import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/ui/common/AnimatedWidget.dart';
import 'package:skroot/ui/common/logo_container.dart';
import 'package:skroot/ui/splash/splach_bloc.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    print("INITTT");
    Timer(Duration(seconds: 5), () => splashBloc.add(AnimationEnd()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, AppState>(
        bloc: splashBloc,
        listener: (BuildContext context, state) {},
        child: BlocBuilder<SplashBloc, AppState>(
          bloc: splashBloc,
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splash_bg.png" , ) ,fit: BoxFit.fill)),
              child: Center(
                child:  AnimatedWidgets(
                  widget: DrowLogo(
                    width: 200,
                    hight: 100,
                  ),
                  horizontalOffset: 0.1,
                  duration: 3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
