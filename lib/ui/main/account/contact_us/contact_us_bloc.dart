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

class ContactUsBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  final messageController = BehaviorSubject<String>();
  final userNameController = BehaviorSubject<String>();
  final emailController = BehaviorSubject<String>();


  String msg;

  Function(String) get updatePhone => phoneController.sink.add;

  Function(String) get updateMessage=> messageController.sink.add;

  Function(String) get userNameChanged => userNameController.sink.add;

  Function(String) get emailChanged => emailController.sink.add;


  Stream<String> get phoneNumber => phoneController.stream.transform(noThing);

  Stream<String> get userName => userNameController.stream.transform(noThing);

  Stream<String> get message =>
      messageController.stream.transform(noThing);

  Stream<String> get email => emailController.stream.transform(noThing);





  void validationFields(){
    if(contactUsBloC.phoneController.value == null){
      contactUsBloC.phoneController.sink.addError("please enter a valid phone number");
    }
    if(contactUsBloC.messageController.value == null){
      contactUsBloC.messageController.sink.addError("please enter a valid message");
    }
    if(contactUsBloC.emailController.value == null){
      contactUsBloC.emailController.sink.addError("please enter a valid email");
    }
    if(contactUsBloC.userNameController.value == null){
      contactUsBloC.userNameController.sink.addError("please enter a valid username");
    }

  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();




  }

  dispose() {
    phoneController.close();
    userNameController.close();
    emailController.close();
    messageController.close();
  }
}

final contactUsBloC = ContactUsBloC();
