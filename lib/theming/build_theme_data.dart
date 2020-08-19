import 'package:flutter/material.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:tinycolor/tinycolor.dart';

import 'colors.dart';

Widget buildThemeData(BuildContext context, Widget navigator) {
  var currentLanguage = AppLocalization.of(context).currentLanguage;
  var fontFamily = currentLanguage == 'ar' ? 'Cairo' : 'Cairo';
  var fontSizeDelta = currentLanguage == 'ar' ? 0.0 : 0.0;

  var lightTheme = ThemeData(
    fontFamily: "Cairo",
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    splashColor: Color(lightThemeColors['sign-bg']),
    primaryColor: Color(lightThemeColors['primary']),
    accentColor: Color(lightThemeColors['secondary']),
    backgroundColor: Color(lightThemeColors['surface-dim']),
    scaffoldBackgroundColor: Color(lightThemeColors['surface-bright']),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    dividerColor: Color(lightThemeColors['border']),
    cardColor: Color(lightThemeColors['surface-bright']),
    highlightColor: Color(lightThemeColors['primary']).withOpacity(0.1),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          onPrimary: TinyColor(Color(lightThemeColors['primary'])).isLight()
              ? Colors.black
              : Colors.white,
          onBackground:
              TinyColor(Color(lightThemeColors['surface-bright'])).isLight()
                  ? Colors.black
                  : Colors.white,
        ),
    textTheme: Theme.of(context)
        .textTheme
        .apply(
            fontFamily: fontFamily,
            fontSizeDelta: fontSizeDelta,
            displayColor: Color(lightThemeColors['text-head']),
            bodyColor: Color(lightThemeColors['text-body']))
        .copyWith(
          overline: Theme.of(context).textTheme.overline.copyWith(
              color: Color(lightThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          caption: Theme.of(context).textTheme.caption.copyWith(
              color: Color(lightThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          body1: Theme.of(context).textTheme.body1.copyWith(
              color: Color(lightThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          subhead: Theme.of(context).textTheme.subhead.copyWith(
              color: Color(lightThemeColors['text-head']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          title: Theme.of(context).textTheme.title.copyWith(
              color: Color(lightThemeColors['title']),
              fontSize: 25.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily),
          headline: Theme.of(context).textTheme.headline.copyWith(
              color: Color(lightThemeColors['text-head']),
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          display1: Theme.of(context).textTheme.display1.copyWith(
              color: Color(lightThemeColors['sub-text-head']),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          display2: Theme.of(context).textTheme.display2.copyWith(
              color: Color(lightThemeColors['text-head']),
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
        ),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        color: Color(lightThemeColors['surface-dim']),
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.light),
  );

  var darkTheme = ThemeData(
    primaryColorBrightness: Brightness.dark,
    brightness: Brightness.dark,
    primaryColor: Color(darkThemeColors['primary']),
    accentColor: Color(darkThemeColors['secondary']),
    backgroundColor: Color(darkThemeColors['surface-bright']),
    scaffoldBackgroundColor: Color(darkThemeColors['surface-dim']),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    dividerColor: Color(darkThemeColors['border']),
    cardColor: Color(darkThemeColors['surface-dim']),
    highlightColor: Color(darkThemeColors['primary']).withOpacity(0.1),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          onPrimary: TinyColor(Color(darkThemeColors['primary'])).isLight()
              ? Colors.black
              : Colors.white,
          onBackground:
              TinyColor(Color(darkThemeColors['surface-bright'])).isLight()
                  ? Colors.black
                  : Colors.white,
        ),
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          fontFamily: fontFamily,
          fontSizeDelta: fontSizeDelta,
          displayColor: Color(darkThemeColors['text-head']),
          bodyColor: Color(darkThemeColors['text-body']),
        )
        .copyWith(
          overline: Theme.of(context).textTheme.overline.copyWith(
              color: Color(darkThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          caption: Theme.of(context).textTheme.caption.copyWith(
              color: Color(darkThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          body1: Theme.of(context).textTheme.body1.copyWith(
              color: Color(darkThemeColors['text-body']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          subhead: Theme.of(context).textTheme.subhead.copyWith(
              color: Color(darkThemeColors['text-head']),
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          title: Theme.of(context).textTheme.title.copyWith(
              color: Color(darkThemeColors['text-head']),
              fontSize: 18.0,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          headline: Theme.of(context).textTheme.headline.copyWith(
              color: Color(darkThemeColors['text-head']),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          display1: Theme.of(context).textTheme.display1.copyWith(
              color: Color(darkThemeColors['text-head']),
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
          display2: Theme.of(context).textTheme.display2.copyWith(
              color: Color(darkThemeColors['text-head']),
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              fontFamily: fontFamily),
        ),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Color(darkThemeColors['surface-dim']),
        brightness: Brightness.dark),
  );

  return Theme(
    data: MediaQuery.of(context).platformBrightness == Brightness.light
        ? lightTheme
        : darkTheme,
    child: navigator,
  );
}
