import 'package:rxdart/rxdart.dart';
import 'package:skroot/helpers/vaildator.dart';

class PagesStreams extends Validator{
  final newParts = BehaviorSubject<bool>();
  final usedParts = BehaviorSubject<bool>();
  final accessories = BehaviorSubject<bool>();

  Function(bool) get newPartsChanged => newParts.sink.add;
  Function(bool) get usedPartsChanged => usedParts.sink.add;
  Function(bool) get accessoriesChanged => accessories.sink.add;

  Stream<bool> get newStream => newParts.stream.transform(noThingBool);
  Stream<bool> get usedStream => usedParts.stream.transform(noThingBool);
  Stream<bool> get accessoriesStream => accessories.stream.transform(noThingBool);

  void dispose(){
    newParts.close();
    usedParts.close();
    accessories.close();
  }
}
final pagesStreams = PagesStreams();