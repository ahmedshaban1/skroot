import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final userNameController = BehaviorSubject<String>();
  final countryIdController = BehaviorSubject<int>();
  final cityIdController = BehaviorSubject<int>();
  final emailController = BehaviorSubject<String>();
  String msg;

  Function(String) get updatePhone => phoneController.sink.add;

  Function(String) get updatePassword => passwordController.sink.add;

  Function(String) get userNameChanged => userNameController.sink.add;

  Function(int) get countryIdChanged => countryIdController.sink.add;

  Function(int) get cityIdChanged => cityIdController.sink.add;

  Function(String) get emailChanged => emailController.sink.add;

  Stream<String> get phoneNumber => phoneController.stream.transform(number);

  Stream<String> get userName =>
      userNameController.stream.transform(noThing);

  Stream<String> get password =>
      passwordController.stream.transform(noThing);

  Stream<String> get email => emailController.stream.transform(noThing);

  Stream<int> get city => cityIdController.stream.transform(selectedId);

  Stream<int> get country => countryIdController.stream.transform(selectedId);

  Stream<bool> get submitChanged =>
      Rx.combineLatest6( password, email, userName, city , country , phoneNumber,( p, e, u , s , c , n)=>true);


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
//      var token = await preferenceManager.readString(CachingKey.AUTH_TOKEN);
      yield (Start(null));
      print("PHONE IS ${phoneController.value}");
      var signUpResponse = await AuthenticationRepo.signUp(SignUpRequest(
          phone: "+971" + phoneController.value,
          email: emailController.value,
          countryId: countryIdController.value.toString(),
          cityId: cityIdController.value.toString(),
          name: userNameController.value,
          password: passwordController.value));

      if (signUpResponse.message == "") {
        preferenceManager.writeData(
            CachingKey.MOBILE_NUMBER, signUpResponse.phone);
        Fluttertoast.showToast(
            msg: signUpResponse.token.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);

        NamedNavigatorImpl().push(Routes.SEND_CODE, arguments: "createAccount");
      } else {
        if(signUpResponse.field.contains("email")){
          emailController.sink.addError(signUpResponse.message);
        }else if(signUpResponse.field.contains("name")){
          userNameController.sink.addError(signUpResponse.message);
        }else if(signUpResponse.field.contains("phone")){
          phoneController.sink.addError(signUpResponse.message);
          Fluttertoast.showToast(
              msg: signUpResponse.token.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.purple,
              fontSize: 16.0);
        }
        NamedNavigatorImpl().pop();
      }
    }
  }

  dispose() {
    phoneController.close();
    passwordController.close();
    userNameController.close();
    cityIdController.close();
    countryIdController.close();
    emailController.close();
  }
}

final signUpBloC = SignUpBloC();
