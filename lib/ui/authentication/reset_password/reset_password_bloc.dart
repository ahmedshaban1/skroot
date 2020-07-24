
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/requests/forget_password/step_three_request.dart';
import 'package:skroot/models/requests/verification/verification_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';

class ResetPasswordBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final confirmPasswordController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  String msg;



  Function(String) get updateConfirmPass => confirmPasswordController.sink.add;
  Function(String) get updatePassword => passwordController.sink.add;

  Stream<String> get confirmPassword => confirmPasswordController.stream.transform(confirmPassWordValidator);
  Stream<String> get password => passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitChanged =>
      Rx.combineLatest2( password, confirmPassword,( p, c, )=>true);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
      var mobile = await preferenceManager.readString(CachingKey.MOBILE_NUMBER);
      var token = await preferenceManager.readInteger(CachingKey.REFERRAL_CODE);
      yield (Start(null));
      var response =await AuthenticationRepo.forgetPasswordStepThree(ForgetPasswordStepThreeRequest(phone: mobile , token: token.toString() , password: passwordController.value));

      if(response.field == ""){
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
  }

  dispose() {
    confirmPasswordController.close();
    passwordController.close();
  }
}

final resetPasswordBloc = ResetPasswordBloc();
