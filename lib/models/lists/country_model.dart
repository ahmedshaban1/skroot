class CountryModel {
  int id;
  String nameEn;
  String nameAr;

  CountryModel({this.id, this.nameEn, this.nameAr});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

}
