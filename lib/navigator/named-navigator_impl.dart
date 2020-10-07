
import 'package:flutter/material.dart';
import 'package:skroot/ui/authentication/enter_phone_number/enter_phone_number.dart';
import 'package:skroot/ui/authentication/intro/intro_page.dart';
import 'package:skroot/ui/authentication/log_in/log_in_page.dart';
import 'package:skroot/ui/authentication/reset_password/reset_password.dart';
import 'package:skroot/ui/authentication/sign_up/sign_up.dart';
import 'package:skroot/ui/authentication/verification_code/verification_code_page.dart';
import 'package:skroot/ui/filter/filter_page.dart';
import 'file:///G:/FlutterProj/skroot_app/lib/ui/main/account/account_details/account_details.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_page.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/edit_address/edit_address_page.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/my_addresses_page.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/add_car/add_car_page.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/edit_car/edit_car_page.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/my_cars_page.dart';
import 'package:skroot/ui/main/account/topices/topoics.dart';
import 'package:skroot/ui/main/master_page//brands/brands_page.dart';
import 'package:skroot/ui/main/master_page/brands/internal/parts/parts_page.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/internal/product_details.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models//model_page.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/product_page.dart';
import 'package:skroot/ui/main/main_page.dart';
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
      case Routes.ENTER_PHONE :return MaterialPageRoute(builder: (_) => EnterPhoneNumber());
      case Routes.HOME_ROUTER :return MaterialPageRoute(builder: (_) => MainPage());
      case Routes.INTRO :return MaterialPageRoute(builder: (_) => IntroPage());
      case Routes.BRANDS :return MaterialPageRoute(builder: (_) => BrandsPage(models: settings.arguments,));
      case Routes.MODEL :return MaterialPageRoute(builder: (_) => ModelPage(model: settings.arguments,));
      case Routes.PARTS :return MaterialPageRoute(builder: (_) => PartsPage(model: settings.arguments,));
      case Routes.PRODUCT :return MaterialPageRoute(builder: (_) => ProductPage(body: settings.arguments,));
      case Routes.PRODUCT_DETAILS :return MaterialPageRoute(builder: (_) => ProductDetails(model: settings.arguments,));
      case Routes.ADD_CAR_TOUTER :return MaterialPageRoute(builder: (_) => AddCarPage());
      case Routes.MY_CARS_ROUTER :return MaterialPageRoute(builder: (_) => MyCarsPage());
      case Routes.TOPICS :return MaterialPageRoute(builder: (_) => Topics(type:settings.arguments));
      case Routes.EDIT_CAR_ROUTER :return MaterialPageRoute(builder: (_) => EditCarPage(editCarArguments: settings.arguments,));
      case Routes.ADD_ADDRESS_ROUTER :return MaterialPageRoute(builder: (_) => AddAddressPage());
      case Routes.MY_ADDRESSES_ROUTER :return MaterialPageRoute(builder: (_) => MyAddressesPage());
      case Routes.EDIT_ADDRESSES_ROUTER :return MaterialPageRoute(builder: (_) => EditAddressPage(editAddressArguments: settings.arguments,));
      case Routes.FILTER_PAGE_ROUTER :return MaterialPageRoute(builder: (_) => FilterPage());
      case Routes.ACCOUNT_DETAILS :return MaterialPageRoute(builder: (_) => AccountDetails());
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
