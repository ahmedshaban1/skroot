class AddCarRequest {
  int car_brand_id;
  int car_brand_model_id;
  int year;

  AddCarRequest(
      {this.car_brand_id,
      this.car_brand_model_id,
      this.year});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_brand_id'] = this.car_brand_id;
    data['car_brand_model_id'] = this.car_brand_model_id;
    data['year'] = this.year;
    return data;
  }
}

class EditCarArguments{
  final int carBrandId , carModelId , carYear , carId ;
  final String carBrandName , carModelName;
  EditCarArguments(this.carBrandId, this.carModelId, this.carYear, this.carBrandName, this.carModelName , this.carId);
}
