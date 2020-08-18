import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
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

}
//"Authorization" : token
