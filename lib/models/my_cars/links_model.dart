class LinksModel {
  String first;
  String last;
  Null prev;
  Null next;

  LinksModel({this.first, this.last, this.prev, this.next});

  LinksModel.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

}
