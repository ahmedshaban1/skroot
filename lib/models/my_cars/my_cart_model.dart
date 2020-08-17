import 'package:skroot/models/my_cars/car_brand_model.dart';
import 'package:skroot/models/my_cars/car_brand_model_model.dart';

class MyCarModel {
  int id;
  String customerId;
  CarBrand carBrand;
  CarBrandModelModel carBrandModel;
  int year;
  String imageUrl;

  MyCarModel(
      {this.id,
        this.customerId,
        this.carBrand,
        this.carBrandModel,
        this.year,
        this.imageUrl});

  MyCarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    carBrand = json['car_brand'] != null
        ? new CarBrand.fromJson(json['car_brand'])
        : null;
    carBrandModel = json['car_brand_model'] != null
        ? new CarBrandModelModel.fromJson(json['car_brand_model'])
        : null;
    year = json['year'];
    imageUrl = json['image_url'];
  }

}
