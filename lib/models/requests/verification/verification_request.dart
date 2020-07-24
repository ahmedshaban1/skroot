class VerificationRequest {
  String phone;
  String token;

  VerificationRequest(
      {
        this.phone,
        this.token});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['phone'] = this.phone;
    return data;
  }
}
