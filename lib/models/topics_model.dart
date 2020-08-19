import 'package:skroot/network/network-mappers.dart';

class TopicsModel  extends BaseMappable{
  Title title;
  Title content;

  TopicsModel({this.title, this.content});



  @override
  Mappable fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Title.fromJson(json['content']) : null;
    return TopicsModel(
      title: title,
      content: content
    );
  }

}

class Title {
  String en;
  String ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

}
