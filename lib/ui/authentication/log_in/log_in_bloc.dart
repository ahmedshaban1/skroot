import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/requests/login/login_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';

class LogInBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final _countryCodeController = BehaviorSubject<String>();
  String msg;


  Function(String) get updatePhone => phoneController.sink.add;

  Function(String) get updatePassword => passwordController.sink.add;

  Function(String) get countryCodeChanged => _countryCodeController.sink.add;


  Stream<String> get phoneNumber => phoneController.stream.transform(noThing);

  Stream<String> get password => passwordController.stream.transform(noThing);

  Stream<String> get countryCode => _countryCodeController.stream.transform(noThing);


  Stream<bool> get submitChanged =>
      Rx.combineLatest2( password, phoneNumber ,( n ,p  )=>true);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    print("___________________${phoneController.value}");
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
//      var token = await preferenceManager.readString(CachingKey.AUTH_TOKEN);
      yield (Start(null));
      print("PHONE IS ${phoneController.value}");
      var userResponse = await AuthenticationRepo.login(LoginRequest(
          phone: "+971"+phoneController.value,
          password: passwordController.value,
          fcm_token: "TEST",
          os: "ios"));

      if(userResponse.field == ""){
//        Fluttertoast.showToast(
//            msg: userResponse.message.toString(),
//            toastLength: Toast.LENGTH_LONG,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIosWeb: 1,
//            backgroundColor: Colors.black87,
//            textColor: Colors.purple,
//            fontSize: 16.0
//        );
      SharedPreferenceManager().writeData(CachingKey.IS_LOGGED_IN, true);
      preferenceManager.writeData(CachingKey.USER_ID, userResponse.user.id);
      preferenceManager.writeData(CachingKey.AUTH_TOKEN, "Bearer "+userResponse.accessToken.token);
      preferenceManager.writeData(CachingKey.USER_IMAGE, userResponse.user.avatarUrl);
      preferenceManager.writeData(CachingKey.USER_NAME, userResponse.user.name);
      preferenceManager.writeData(CachingKey.MOBILE_NUMBER, userResponse.user.phone);
      preferenceManager.writeData(CachingKey.COUNTRY, userResponse.user.country.nameEn);
      preferenceManager.writeData(CachingKey.CITY, userResponse.user.city.nameEn);
      preferenceManager.writeData(CachingKey.EMAIL, userResponse.user.email);
      preferenceManager.writeData(CachingKey.MOBILE_NUMBER, userResponse.user.phone);
        NamedNavigatorImpl().push(Routes.HOME_ROUTER , clean: true);
      }
      else {
        NamedNavigatorImpl().pop();
        if(userResponse.field == "phone"){
          phoneController.sink.addError(userResponse.message.toString());
        }else if(userResponse.code == "WrongPassword"){
          passwordController.sink.addError(userResponse.message.toString());
        }

      }
    }

  }

  dispose() {
    phoneController.close();
    passwordController.close();
    _countryCodeController.close();
  }
}

final logInBloc = LogInBloc();
