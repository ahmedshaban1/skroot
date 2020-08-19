
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/requests/forget_password/step_two_request.dart';
import 'package:skroot/models/requests/verification/verification_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';

class VerificationCodeBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final codeController = BehaviorSubject<String>();
  String msg;



  Function(String) get updateCode => codeController.sink.add;


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {

      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
      var mobile = await preferenceManager.readString(CachingKey.MOBILE_NUMBER);
      yield (Start(null));
      var response =await AuthenticationRepo.verifyAccount(VerificationRequest(phone: mobile , token: codeController.value));

      if(response.field == ""){
        preferenceManager.writeData(CachingKey.USER_ID, response.user.id);
        preferenceManager.writeData(CachingKey.AUTH_TOKEN, "Bearer "+response.accessToken.token);
        preferenceManager.writeData(CachingKey.USER_IMAGE, response.user.avatarUrl);
        preferenceManager.writeData(CachingKey.USER_NAME, response.user.name);
        preferenceManager.writeData(CachingKey.MOBILE_NUMBER, response.user.phone);
        SharedPreferenceManager().writeData(CachingKey.IS_LOGGED_IN, true);
        NamedNavigatorImpl().push(Routes.HOME_ROUTER , clean: true);

      }

      else {
        NamedNavigatorImpl().pop();
        Fluttertoast.showToast(
            msg: response.message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.purple,
            fontSize: 16.0
        );
      }
    }

    if(event is Add){
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
      var mobile = await preferenceManager.readString(CachingKey.MOBILE_NUMBER);
      yield (Start(null));
      var response =await AuthenticationRepo.forgetPasswordStepTwo(ForgetPasswordStepTwoRequest(phone: mobile , token: codeController.value));

      if(response.field == ""){
        NamedNavigatorImpl().push(Routes.RESET_PASSWORD );
      }
      else {
        NamedNavigatorImpl().pop();
        Fluttertoast.showToast(
            msg: response.message.toString(),
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
    codeController.close();
  }
}

final verificationCodeBloc = VerificationCodeBloc();
