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
  String msg;


  Function(String) get updatePhone => phoneController.sink.add;

  Function(String) get updatePassword => passwordController.sink.add;

  Stream<String> get phoneNumber => phoneController.stream.transform(number);

  Stream<String> get password => passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitChanged =>
      Rx.combineLatest2( password, phoneNumber ,( n ,p  )=>true);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
//      var token = await preferenceManager.readString(CachingKey.AUTH_TOKEN);
      yield (Start(null));
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
        NamedNavigatorImpl().push(Routes.HOME_ROUTER , clean: true);
      }

      else {
        NamedNavigatorImpl().pop();
        Fluttertoast.showToast(
            msg: userResponse.message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.purple,
            fontSize: 16.0
        );
      }
    }

  }

  dispose() {
    phoneController.close();
    passwordController.close();
  }
}

final logInBloc = LogInBloc();
