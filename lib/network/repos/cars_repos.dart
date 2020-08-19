import 'package:skroot/models/cars/accessories/accessories_model.dart';
import 'package:skroot/models/cars/products/products_model.dart';
import 'package:skroot/models/my_cars/car_brand_model_model.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';

import '../networkUtlis.dart';
import '../../models/cars/brands/car_brands_model.dart';
import '../../models/cars/parts/parts_model.dart';
import '../../models/cars/model/brand_model_response.dart';

class CarsRepos {

  static Future<CarBrandResponse> carsBrands() {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    return  NetworkUtil.internal().get(CarBrandResponse(), "general/car-brands");
  }

  static Future<PartsCategoriesResponse> partsCategory() {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    return  NetworkUtil.internal().get(PartsCategoriesResponse(), "general/part-categories"  );
  }
  static Future<BrandsModelResponse> brandsModels(int id) {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    return  NetworkUtil.internal().get(BrandsModelResponse(),"general/car-brands/$id/models" , headers: map);
  }
  static Future<AccessoriesModel> accessories(String token) {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    return  NetworkUtil.internal().get(AccessoriesModel(), "accessories" , headers: map);
  }
  static Future<ProductsModel> products(String token , {int carBrandId , int carModelId , int catId , int year}) {
    Map<String , String> map = Map();
    map["Content-Type"] = "application/json";
    map["Accept"] = "application/json";
    map["Authorization"] = token;
    Map<String , dynamic> body = Map();
    if(carBrandId != null){
      body["car_brand_id"] = carBrandId;
    }if(carModelId != null){
      body["car_brand_model_id"] = carModelId;
    }if(catId != null){
      body["part_category_id"] = catId;
    }if(year != null){
      body["year"] = year;
    }
    return  NetworkUtil.internal().get(ProductsModel(), "parts" , headers: map , queryParameters: body);

  }
}
