
import 'package:skroot/network/network-mappers.dart';

class EmptyModel extends BaseMappable {

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return EmptyModel();
  }
}
