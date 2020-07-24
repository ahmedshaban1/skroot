class ForgetPasswordStepTwoRequest {
  String phone;
  String token;

  ForgetPasswordStepTwoRequest(
      {this.phone,this.token});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['token'] = this.token;
    return data;
  }
}
