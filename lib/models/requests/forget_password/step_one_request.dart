class ForgetPasswordStepOneRequest {
  String phone;

  ForgetPasswordStepOneRequest(
      {this.phone,});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}
