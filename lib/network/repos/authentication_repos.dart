import 'dart:convert';

import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/network/networkUtlis.dart';

class AuthenticationRepo {

  static Future<EmptyModel> signUp(SignUpRequest signUpRequest){
    
    return NetworkUtil.internal().post(EmptyModel(), "auth/register" ,body: signUpRequest.toJson());
  }

}