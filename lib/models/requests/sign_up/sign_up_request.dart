class SignUpRequest {
  String name;
  String phone;
  String email;
  String password;
  String countryId;
  String cityId;

  SignUpRequest(
      {this.name,
        this.phone,
        this.email,
        this.password,
        this.countryId,
        this.cityId});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    countryId = json['country_id'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    return data;
  }
}
