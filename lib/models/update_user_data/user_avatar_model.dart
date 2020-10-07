import 'package:skroot/network/network-mappers.dart';

class AvatarModel extends BaseMappable {
  String avatar;
  String message;
  String field;
  AvatarModel({this.avatar , this.message , this.field});


  @override
  Mappable fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'] ?? null;
    message = json['message'] ?? null;
    field = json['field']  ?? null;
    return AvatarModel(avatar: avatar , message: message , field: field);
  }
}
