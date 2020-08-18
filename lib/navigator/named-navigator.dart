class Routes {
  static const SPLASH_ROUTER = "SPLASH_ROUTER";
  static const LOGIN_ROUTER = "LOGIN_ROUTER";
  static const SIGNUP_ROUTER = "SIGNUP_ROUTER";
  static const INTRO = "INTRO";
  static const SEND_CODE = "SEND_CODE";
  static const RESET_PASSWORD = "RESET_PASSWORD";
  static const HOME_ROUTER = "HOME_ROUTER";
  static const ENTER_PHONE = "ENTER_PHONE";
  static const BRANDS = "BRANDS";
  static const PRODUCT = "PRODUCT";
  static const MODEL = "MODEL";
  static const PARTS = "PARTS";
  static const ADD_CAR_TOUTER = "ADD_CAR_TOUTER";
  static const PRODUCT_DETAILS = "PRODUCT_DETAILS";
  static const MY_CARS_ROUTER = "MY_CARS_ROUTER";
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
