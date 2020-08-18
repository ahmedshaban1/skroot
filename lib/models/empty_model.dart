
import 'package:skroot/network/network-mappers.dart';

class EmptyModel extends BaseMappable {
   String message;
   String field;
  EmptyModel({this.message , this.field});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    message = json['message']??"";
    field = json['field']??"";
    return EmptyModel(message: message , field: field);
  }
}
