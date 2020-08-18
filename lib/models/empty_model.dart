
import 'package:skroot/network/network-mappers.dart';

class EmptyModel extends BaseMappable {
  int id;
   String message;
   String field;
  EmptyModel({this.message , this.field , this.id});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    message = json['message']??"";
    id = json['id']??0;
    field = json['field']??"";
    return EmptyModel(message: message , field: field);
  }
}
