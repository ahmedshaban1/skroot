class ContactUsRequest {
  String name;
  String email;
  String phone;
  String message;

  ContactUsRequest(
      {
        this.name,
        this.message , this.phone , this.email});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['message'] = this.message;
    return data;
  }
}
