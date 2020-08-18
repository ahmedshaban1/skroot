import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/requests/authed_user/my_addresses.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/repos/user_reps.dart';

class AddAddressBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  final cityId = BehaviorSubject<int>();
  final countryId = BehaviorSubject<int>();
  final zipCode = BehaviorSubject<int>();

  final title = BehaviorSubject<String>();
  final street = BehaviorSubject<String>();
  final phoneNumber = BehaviorSubject<String>();

  Function(int) get updateCityId => cityId.sink.add;

  Function(int) get updateCountryId => countryId.sink.add;

  Function(int) get updateZipCode => zipCode.sink.add;

  Function(String) get updateTitle => title.sink.add;

  Function(String) get updateStreet => street.sink.add;

  Function(String) get updatePhoneNumber => phoneNumber.sink.add;

  Stream<int> get cityIdStream => cityId.stream.transform(selectedId);

  Stream<int> get countryIdStream => countryId.stream.transform(selectedId);

  Stream<int> get zipCodeStream => zipCode.stream.transform(selectedId);

  Stream<String> get titleStream => title.stream.transform(nameValidator);

  Stream<String> get streetStream => street.stream.transform(nameValidator);

  Stream<String> get phoneNumberStream => phoneNumber.stream.transform(number);

  Stream<bool> get submitChanged => Rx.combineLatest6(
      cityIdStream,
      countryIdStream,
      streetStream,
      zipCodeStream,
      titleStream,
      phoneNumberStream,
      (a, b, c, d, e, f) => true);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var mSharedPreferenceManager = SharedPreferenceManager();

    if (event is Click) {
      yield Loading(null);

      var token =
          await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      EmptyModel response = await UserDataRepo.addAddressRequest(
          AddAddressRequest(
              title: title.value,
              phone: phoneNumber.value,
              city_id: cityId.value,
              country_id: countryId.value,
              street: street.value,
              zip_code: zipCode.value),
          token);

      if (response.id != 0) {
        NamedNavigatorImpl().pop();
        NamedNavigatorImpl().pop(result: true);
      } else {
        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);
      }
    }
  }

  dispose() {
    cityId.close();
    countryId.close();
    zipCode.close();
    title.close();
    street.close();
    phoneNumber.close();
  }
}

final addAddressBloc = AddAddressBloc();
