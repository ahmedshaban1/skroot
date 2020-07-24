import 'package:skroot/network/network-mappers.dart';

class SignUpResponse extends BaseMappable{
  String phone;
  int token;
  String message;


  SignUpResponse({this.phone, this.token , this.message});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    token = json['token']??0;
    message = json["message"] ?? "";
  return SignUpResponse(phone: phone , token: token , message: message);
  }

}
