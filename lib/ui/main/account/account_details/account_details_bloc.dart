import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/models/update_user_data/user_avatar_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skroot/network/repos/user_reps.dart';
import 'package:skroot/ui/main/master_page/get_from_shared_bloc.dart';

class AccountDetailsBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();
  final userNameController = BehaviorSubject<String>();
  final countryIdController = BehaviorSubject<int>();
  final cityIdController = BehaviorSubject<int>();
  final emailController = BehaviorSubject<String>();
  final _countryCodeController = BehaviorSubject<String>();
  final imageCodeController = BehaviorSubject<File>();

  String msg;

  Function(String) get updatePhone => phoneController.sink.add;

  Function(String) get updatePassword => passwordController.sink.add;

  Function(String) get userNameChanged => userNameController.sink.add;

  Function(int) get countryIdChanged => countryIdController.sink.add;

  Function(int) get cityIdChanged => cityIdController.sink.add;

  Function(File) get imageChanged => imageCodeController.sink.add;

  Function(String) get countryCodeChanged => _countryCodeController.sink.add;

  Function(String) get emailChanged => emailController.sink.add;

  Stream<String> get phoneNumber => phoneController.stream.transform(noThing);

  Stream<String> get userName => userNameController.stream.transform(noThing);

  Stream<String> get password => passwordController.stream.transform(noThing);

  Stream<String> get email => emailController.stream.transform(noThing);

  Stream<int> get city => cityIdController.stream.transform(selectedId);

  Stream<int> get country => countryIdController.stream.transform(selectedId);
  Stream<File> get image => imageCodeController.stream.asBroadcastStream();

  Stream<bool> get submitChanged => Rx.combineLatest6(userName, phoneNumber,
      email, country, city, password, (p, e, u, s, c, n) => true);

  Future<bool> nullableValues() {
    passwordController.value = null;
    cityIdController.value = null;
    countryIdController.value = null;
    userNameController.value = null;
    emailController.value = null;
    return NamedNavigatorImpl().push(Routes.LOGIN_ROUTER, clean: true);
  }

  void validationFields() {
    if (phoneController.value == null) {
      phoneController.sink.addError("please enter a valid phone number");
    }
    if (passwordController.value == null) {
      passwordController.sink.addError("please enter a valid password");
    }
    if (cityIdController.value == null) {
      cityIdController.sink.addError("please enter a valid city Id");
    }
    if (countryIdController.value == null) {
      countryIdController.sink.addError("please enter a country Id");
    }
    if (emailController.value == null) {
      emailController.sink.addError("please enter a valid email");
    }
    if (userNameController.value == null) {
      userNameController.sink.addError("please enter a valid username");
    }
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
//      var token = await preferenceManager.readString(CachingKey.AUTH_TOKEN);
      yield (Start(null));
      print("PHONE IS ${phoneController.value}");
      var response = await UserDataRepo.updateUserData(SignUpRequest(
          phone: "+971" + phoneController.value,
          email: emailController.value,
          countryId: countryIdController.value.toString(),
          cityId: cityIdController.value.toString(),
          name: userNameController.value,
          password: passwordController.value) , await preferenceManager.readString(CachingKey.AUTH_TOKEN));
      NamedNavigatorImpl().pop();
      preferenceManager.writeData(CachingKey.USER_ID, response.user.id);
      preferenceManager.writeData(CachingKey.AUTH_TOKEN, "Bearer "+response.accessToken.token);
      preferenceManager.writeData(CachingKey.USER_IMAGE, response.user.avatarUrl);
      preferenceManager.writeData(CachingKey.USER_NAME, response.user.name);
      preferenceManager.writeData(CachingKey.MOBILE_NUMBER, response.user.phone);
      Fluttertoast.showToast(
          msg: "Done",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.purple,
          fontSize: 16.0);

    } else {
      print("HERE IS UPDATE DATA");
      AvatarModel response = await UserDataRepo.updateUserAvatar(imageCodeController.value,
          await preferencesManager.readString(CachingKey.AUTH_TOKEN));
      NamedNavigatorImpl().pop();
      if(response.avatar != null){
        preferencesManager.writeData(CachingKey.USER_IMAGE, response.avatar);
        getFromShared.add(GetShared());
        Fluttertoast.showToast(
            msg: "changed success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);
      }else{
        NamedNavigatorImpl().pop();
        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);
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
    _countryCodeController.close();
    imageCodeController.close();
  }
}

final accountDetailsBloC = AccountDetailsBloC();
