import 'package:skroot/network/network-mappers.dart';

class IntroResponse extends BaseMappable {
  List<Data> data;

  IntroResponse({this.data});





  @override
  Mappable fromJson(Map<String,dynamic > json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }

  return IntroResponse(data: data);
  }
}

class Data {
  int id;
  String titleEn;
  String titleAr;
  String contentEn;
  String contentAr;
  String imageUrl;

  Data(
      {this.id,
        this.titleEn,
        this.titleAr,
        this.contentEn,
        this.contentAr,
        this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    contentEn = json['content_en'];
    contentAr = json['content_ar'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['content_en'] = this.contentEn;
    data['content_ar'] = this.contentAr;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
