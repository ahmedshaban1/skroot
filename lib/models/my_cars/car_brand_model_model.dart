import 'name_model.dart';

class CarBrandModelModel {
  int id;
  String carBrandId;
  NameModel name;

  CarBrandModelModel({this.id, this.carBrandId, this.name});

  CarBrandModelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carBrandId = json['car_brand_id'];
    name = json['name'] != null ? new NameModel.fromJson(json['name']) : null;
  }

}
