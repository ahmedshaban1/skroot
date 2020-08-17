import 'address_city_model.dart';
import 'address_country_model.dart';

class MyAddressModel {
  int id;
  String customerId;
  String title;
  AddressCountryModel country;
  AddressCityModel city;
  String street;
  int zipCode;
  String phone;

  MyAddressModel(
      {this.id,
        this.customerId,
        this.title,
        this.country,
        this.city,
        this.street,
        this.zipCode,
        this.phone});

  MyAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    country = json['country'] != null ? new AddressCountryModel.fromJson(json['country']) : null;
    city = json['city'] != null ? new AddressCityModel.fromJson(json['city']) : null;
    street = json['street'];
    zipCode = json['zip_code'];
    phone = json['phone'];
  }

}
