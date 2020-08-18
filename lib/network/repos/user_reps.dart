import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/models/requests/authed_user/my_addresses.dart';
import 'package:skroot/models/requests/authed_user/my_cars.dart';

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




}
//"Authorization" : token
