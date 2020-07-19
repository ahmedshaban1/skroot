
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/network/networkUtlis.dart';

class EnterPhoneNumberBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final phoneController = BehaviorSubject<String>();
  String msg;



  Function(String) get updatePhone => phoneController.sink.add;

  Stream<String> get phoneNumber => phoneController.stream.transform(number);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var netUtil = NetworkUtil();
    if (event is Click) {
      SharedPreferenceManager preferenceManager = SharedPreferenceManager();
      var token = await preferenceManager.readString(CachingKey.AUTH_TOKEN);
      yield (Start(null));

    }
  }

  dispose() {
    phoneController.close();
  }
}

final enterPhoneNumberBloc = EnterPhoneNumberBloc();
