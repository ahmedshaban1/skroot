import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skroot/models/authentication/login_response.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/models/requests/authed_user/my_addresses.dart';
import 'package:skroot/models/requests/authed_user/my_cars.dart';
import 'package:skroot/models/requests/login/login_request.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/models/topics_model.dart';
import 'package:skroot/models/update_user_data/user_avatar_model.dart';
import 'package:skroot/models/user_date_response.dart';

import '../networkUtlis.dart';

class UserDataRepo
{

  static Future<MyCarsResponse> fetchMyCarsList( String  token) {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return  NetworkUtil.internal().get(MyCarsResponse(),  "auth-customer/cars" , headers: map );
  }


  static Future<EmptyModel> addCarRequest(AddCarRequest addCarRequest ,String token){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().post(EmptyModel(), "auth-customer/cars" , headers: map , body: addCarRequest);
  }
  static Future<EmptyModel> updateMyCar(AddCarRequest addCarRequest ,String token , int carId){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().put(EmptyModel(), "auth-customer/cars/$carId" , headers: map , body: addCarRequest);
  }
  static Future<EmptyModel> deleteCar(String token , int carId){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().delete(EmptyModel(), "auth-customer/cars/$carId" , headers: map);
  }

  static Future<MyAddressesResponse> fetchMyAddressesList( String  token) {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return  NetworkUtil.internal().get(MyAddressesResponse(),  "auth-customer/addresses" , headers: map );
  }


  static Future<EmptyModel> addAddressRequest(AddAddressRequest addAddressRequest ,String token){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().post(EmptyModel(), "auth-customer/addresses" , headers: map , body: addAddressRequest);
  }
  static Future<EmptyModel> updateMyAddress(AddAddressRequest addAddressRequest ,String token , int carId){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().put(EmptyModel(), "auth-customer/addresses/$carId" , headers: map , body: addAddressRequest);
  }
  static Future<EmptyModel> deleteAddress(String token , int carId){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().delete(EmptyModel(), "auth-customer/addresses/$carId" , headers: map);
  }

  static Future<TopicsModel> getTerms(){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    return NetworkUtil.internal().get(TopicsModel(), "pages/terms" , headers: map);
  }
  static Future<TopicsModel> getPrivacy(){
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    return NetworkUtil.internal().get(TopicsModel(), "pages/privacy" , headers: map);
  }

  static Future<AvatarModel> updateUserAvatar(File avatar ,String token) async{
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    FormData formData = FormData.fromMap({
      "avatar" : await MultipartFile.fromFile(avatar.path)
    });
    return NetworkUtil.internal().post(AvatarModel(), "auth-customer/settings/upload-avatar" , headers: map , body: formData);
  }

  static Future<UpdateUserResponse> updateUserData(SignUpRequest userDate ,String token) async{
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return NetworkUtil.internal().put(UpdateUserResponse(), "auth-customer/settings" , headers: map , body: userDate.toJson());
  }


}
//"Authorization" : token
