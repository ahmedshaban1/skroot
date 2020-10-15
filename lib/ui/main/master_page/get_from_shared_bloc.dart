import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';

class GetFromShared extends Bloc<AppEvent, AppState> {

  String username = "" ;
  String email = "" ;
  String image = "" ;
  String createdAt = "" ;
  String token = "" ;
  String countryName = "" ;
  String cityName = "" ;
  String countryCode = "" ;
  String phone = "" ;
  int countryId  ;
  int cityId  ;
  int type  ;
  int id ;
  bool signIn  ;
  bool intoFirst  ;
  SharedPreferenceManager _manager = SharedPreferenceManager();


  @override
  // TODO: implement initialState
  AppState get initialState => Loading(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event)  async*{
    yield Loading(null);
    if (event is GetShared) {
       image = await _manager.readString(CachingKey.USER_IMAGE);
       username = await _manager.readString(CachingKey.USER_NAME);
       cityName = await _manager.readString(CachingKey.CITY);
       cityId = await _manager.readInteger(CachingKey.CITY_ID);
       countryId = await _manager.readInteger(CachingKey.COUNTRY_ID);
       countryName = await _manager.readString(CachingKey.COUNTRY);
       email = await _manager.readString(CachingKey.EMAIL);
       token = await _manager.readString(CachingKey.AUTH_TOKEN);
       type = await _manager.readInteger(CachingKey.USER_TYPE);
       id = await _manager.readInteger(CachingKey.USER_ID);
       phone = await _manager.readString(CachingKey.MOBILE_NUMBER);

      print("__________Auth is ______________ $token");
      print("__________name ______________ $username");
      print("________________________ The End OF Shared _________________");
      yield Start(null);
    }
  }
}
GetFromShared getFromShared = GetFromShared();