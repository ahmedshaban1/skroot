import 'dart:convert';

// Handler for the network's request.
abstract class RequestMappable {
  Map<String, dynamic> toJson();
}

// Handler for the network's response.

abstract class Mappable<T> {
  factory Mappable(Mappable type, String data ) {
    if (type is BaseMappable) {
      Map<String, dynamic> mappingData = json.decode(data);
//      mappingData["success"] = isSuccessfull;
      return type.fromJson(mappingData);
    } else if (type is ListMappable) {
      print("LIST DATA $data");
      Iterable list = json.decode(data);
      print("This DATA $data");
      return type.fromJsonList(list);
    }
    return null;
  }
}

abstract class BaseMappable<T> implements Mappable {
  Mappable fromJson(Map<String, dynamic> json);
}

abstract class ListMappable<T> implements Mappable {
  Mappable fromJsonList(List<dynamic> json);
}

