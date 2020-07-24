class ForgetPasswordStepThreeRequest {
  String phone;
  String token;
  String password;

  ForgetPasswordStepThreeRequest(
      {this.phone,this.token , this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['token'] = this.token;
    data['password'] = this.password;
    return data;
  }
}
