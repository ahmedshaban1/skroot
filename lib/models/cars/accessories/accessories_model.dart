import 'package:skroot/network/network-mappers.dart';

class AccessoriesModel extends BaseMappable {
  List<Data> data;
  Links links;
  Meta meta;

  AccessoriesModel({this.data, this.links, this.meta});

  AccessoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    return AccessoriesModel(
      meta: meta ,
      links: links ,
      data: data
    );
  }

}

class Data {
  int id;
  Name name;
  Name description;
  CarBrand carBrand;
  CarBrandModel carBrandModel;
  CarBrand partCategory;
  int year;
  double price;

  Data(
      {this.id,
        this.name,
        this.description,
        this.carBrand,
        this.carBrandModel,
        this.partCategory,
        this.year,
        this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    carBrand = json['car_brand'] != null
        ? new CarBrand.fromJson(json['car_brand'])
        : null;
    carBrandModel = json['car_brand_model'] != null
        ? new CarBrandModel.fromJson(json['car_brand_model'])
        : null;
    partCategory = json['part_category'] != null
        ? new CarBrand.fromJson(json['part_category'])
        : null;
    year = json['year'];
    price = json['price'];
  }

}

class Name {
  String en;
  String ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class CarBrand {
  int id;
  Name name;
  String imageUrl;

  CarBrand({this.id, this.name, this.imageUrl});

  CarBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class CarBrandModel {
  int id;
  Name name;

  CarBrandModel({this.id, this.name});

  CarBrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

}

class Links {
  String first;
  String last;
  Null prev;
  Null next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}
