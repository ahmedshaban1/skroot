import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/network/network-mappers.dart';

class CountriesResponse extends BaseMappable{

  List<CountryModel> data ;

  CountriesResponse({this.data});


  @override
  Mappable fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CountryModel>();
      json['data'].forEach((v) {
        data.add(new CountryModel.fromJson(v));
      });
    }

    return CountriesResponse(data: data);
    throw UnimplementedError();
  }

}