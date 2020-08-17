import 'package:skroot/models/my_cars/links_model.dart';
import 'package:skroot/models/my_cars/meta_model.dart';
import 'package:skroot/models/my_cars/my_cart_model.dart';
import 'package:skroot/network/network-mappers.dart';

class MyCarsResponse  extends BaseMappable{
  List<MyCarModel> data;
  LinksModel links;
  MetaModel meta;

  MyCarsResponse({this.data, this.links, this.meta});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MyCarModel>();
      json['data'].forEach((v) {
        data.add(new MyCarModel.fromJson(v));
      });
    }
    links = json['links'] != null ? new LinksModel.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new MetaModel.fromJson(json['meta']) : null;
    return MyCarsResponse(data: data, links: links , meta: meta);
  }

}






