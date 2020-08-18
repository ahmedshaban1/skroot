import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';

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

}
//"Authorization" : token
