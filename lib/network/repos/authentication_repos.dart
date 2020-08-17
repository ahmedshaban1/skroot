import 'package:skroot/models/authentication/login_response.dart';
import 'package:skroot/models/authentication/sign_up_response.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/requests/forget_password/step_one_request.dart';
import 'package:skroot/models/requests/forget_password/step_three_request.dart';
import 'package:skroot/models/requests/forget_password/step_two_request.dart';
import 'package:skroot/models/requests/login/login_request.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/models/requests/verification/verification_request.dart';
import 'package:skroot/network/networkUtlis.dart';

class AuthenticationRepo {
  static Future<SignUpResponse> signUp(SignUpRequest signUpRequest) =>
      NetworkUtil.internal().post(SignUpResponse(), "auth/register",
          body: signUpRequest.toJson());

  static Future<LoginResponse> verifyAccount(
          VerificationRequest verificationRequest) =>
      NetworkUtil.internal().post(LoginResponse(), "auth/verify-phone",
          body: verificationRequest.toJson());

  static Future<LoginResponse> login(LoginRequest loginRequest) =>
      NetworkUtil.internal()
          .post(LoginResponse(), "auth/login", body: loginRequest.toJson());

  static Future<SignUpResponse> forgetPasswordStepOne(
          ForgetPasswordStepOneRequest forgetPasswordStepOneRequest) =>
      NetworkUtil.internal().post(SignUpResponse(), "password/forgot",
          body: forgetPasswordStepOneRequest.toJson());

  static Future<EmptyModel> forgetPasswordStepTwo(
          ForgetPasswordStepTwoRequest forgetPasswordStepTwoRequest) =>
      NetworkUtil.internal().post(EmptyModel(), "password/token",
          body: forgetPasswordStepTwoRequest.toJson());

  static Future<LoginResponse> forgetPasswordStepThree(
          ForgetPasswordStepThreeRequest forgetPasswordStepThreeRequest) =>
      NetworkUtil.internal().post(LoginResponse(), "password/set",
          body: forgetPasswordStepThreeRequest.toJson());
}
