import 'package:skroot/models/my_cars/name_model.dart';

import 'package:skroot/models/my_cars/name_model.dart';

class AddressCityModel {
  int id;
  String countryId;
  NameModel name;

  AddressCityModel({this.id, this.countryId, this.name});

  AddressCityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'] != null ? new NameModel.fromJson(json['name']) : null;
  }

}
