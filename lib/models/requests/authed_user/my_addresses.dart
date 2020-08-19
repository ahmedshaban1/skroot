class AddAddressRequest {
  String title;
  String street;
  String phone;
  int country_id;
  int city_id;
  int zip_code;

  AddAddressRequest(
      {this.phone , this.title, this.city_id , this.country_id , this.street , this.zip_code});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['country_id'] = this.country_id;
    data['city_id'] = this.city_id;
    data['street'] = this.street;
    data['zip_code'] = this.zip_code;
    data['phone'] = this.phone;
    return data;
  }
}
class EditAddressArguments{
  final int cityId , zipCode , countryId  , addressId   ;
  final String cityName , countryName , street ,title  , phone;

  EditAddressArguments( {this.addressId,this.phone, this.cityId, this.zipCode, this.countryId, this.cityName, this.countryName, this.street, this.title});

}
