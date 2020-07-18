
import 'package:flutter/material.dart';
import 'package:skroot/ui/authentication/log_in/log_in_page.dart';
import 'package:skroot/ui/authentication/reset_password/reset_password.dart';
import 'package:skroot/ui/authentication/sign_up/sign_up.dart';
import 'package:skroot/ui/authentication/verification_code/verification_code_page.dart';
import 'package:skroot/ui/splash/splash_view.dart';

import 'named-navigator.dart';

class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      new GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH_ROUTER :return MaterialPageRoute(builder: (_) => Splash());
      case Routes.LOGIN_ROUTER :return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.SIGNUP_ROUTER :return MaterialPageRoute(builder: (_) => SignUpPage());
      case Routes.RESET_PASSWORD :return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      case Routes.SEND_CODE :return MaterialPageRoute(builder: (_) => VerificationCodePage(stateOfCode: settings.arguments,));
    }

//    return MaterialPageRoute(builder: (_) => Container());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState.canPop())
      navigatorState.currentState.pop(result);
  }

  @override
  Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean)
      return navigatorState.currentState.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);

    if (replace)
      return navigatorState.currentState
          .pushReplacementNamed(routeName, arguments: arguments);

    return navigatorState.currentState
        .pushNamed(routeName, arguments: arguments);
  }
}
