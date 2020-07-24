
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/requests/forget_password/step_one_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';

class EnterPhoneNumberBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  String msg;



  Function(String) get updatePhone => phoneController.sink.add;

  Stream<String> get phoneNumber => phoneController.stream.transform(number);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
      yield (Start(null));
  var response = await  AuthenticationRepo.forgetPasswordStepOne(ForgetPasswordStepOneRequest(phone: "+971"+phoneController.value));
  if(response.token != 0) {
    preferenceManager.writeData(CachingKey.MOBILE_NUMBER,"+971"+ phoneController.value);
    preferenceManager.writeData(CachingKey.REFERRAL_CODE,response.token);
    NamedNavigatorImpl().push(Routes.SEND_CODE ,arguments: "resetPassword");
    Fluttertoast.showToast(
        msg: response.token.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.purple,
        fontSize: 16.0
    );
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
    phoneController.close();
  }
}

final enterPhoneNumberBloc = EnterPhoneNumberBloc();
