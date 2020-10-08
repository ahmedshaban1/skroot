import 'dart:io';

class AddCarRequest {
  int car_brand_id;
  int car_brand_model_id;
  int year;
  File image;

  AddCarRequest(
      {this.car_brand_id,
      this.car_brand_model_id,
      this.year , this.image});

}

class EditCarArguments{
  final int carBrandId , carModelId , carYear , carId ;
  final String carBrandName , carModelName , image;
  EditCarArguments(this.carBrandId, this.carModelId, this.carYear, this.carBrandName, this.carModelName , this.carId, this.image);
}
