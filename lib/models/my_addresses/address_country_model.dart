import 'package:skroot/models/my_cars/name_model.dart';

import 'package:skroot/models/my_cars/name_model.dart';

class AddressCountryModel {
  int id;
  NameModel name;

  AddressCountryModel({this.id, this.name});

  AddressCountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new NameModel.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    return data;
  }
}
