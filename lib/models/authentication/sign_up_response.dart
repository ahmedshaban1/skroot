import 'package:skroot/network/network-mappers.dart';

class SignUpResponse extends BaseMappable{
  String phone;
  int token;
  String message;
  String field;



  SignUpResponse({this.phone, this.token , this.message ,  this.field});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    token = json['token']??0;
    message = json["message"] ?? "";
    field = json["field"] ?? "";
  return SignUpResponse(phone: phone , token: token , message: message , field: field );
  }

}
