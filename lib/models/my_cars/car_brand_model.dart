import 'package:skroot/models/my_cars/name_model.dart';

import 'package:skroot/models/my_cars/name_model.dart';

class CarBrand {
  int id;
  NameModel name;
  String imageUrl;

  CarBrand({this.id, this.name, this.imageUrl});

  CarBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new NameModel.fromJson(json['name']) : null;
    imageUrl = json['image_url'];
  }

}
