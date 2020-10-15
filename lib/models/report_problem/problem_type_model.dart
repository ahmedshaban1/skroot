class ProblemTypeModel {
  int id;
  Label label;

  ProblemTypeModel({this.id, this.label});

  ProblemTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'] != null ? new Label.fromJson(json['label']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.label != null) {
      data['label'] = this.label.toJson();
    }
    return data;
  }
}

class Label {
  String en;
  String ar;

  Label({this.en, this.ar});

  Label.fromJson(Map<String, dynamic> json) {
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
