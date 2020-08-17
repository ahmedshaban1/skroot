import 'package:skroot/models/my_addresses/my_address_model.dart';
import 'package:skroot/models/my_cars/links_model.dart';
import 'package:skroot/models/my_cars/meta_model.dart';
import 'package:skroot/network/network-mappers.dart';

class MyAddressesResponse extends BaseMappable {
  List<MyAddressModel> data;
  LinksModel links;
  MetaModel meta;

  MyAddressesResponse({this.data, this.links, this.meta});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MyAddressModel>();
      json['data'].forEach((v) {
        data.add(new MyAddressModel.fromJson(v));
      });
    }
    links =
        json['links'] != null ? new LinksModel.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new MetaModel.fromJson(json['meta']) : null;
    return MyAddressesResponse(meta: meta, links: links, data: data);
  }

}
