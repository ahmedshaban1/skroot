class LoginRequest {
  String phone;
  String password;
  String fcm_token;
  String os;

  LoginRequest(
      {this.phone,
        this.password,
        this.fcm_token,
        this.os});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['fcm_token'] = this.fcm_token;
    data['os'] = this.os;
    return data;
  }
}
