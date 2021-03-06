import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/requests/authed_user/my_cars.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/repos/user_reps.dart';

class AddCarBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  var carBrandId = BehaviorSubject<int>();
  var carModelId = BehaviorSubject<int>();
  var carYear = BehaviorSubject<int>();
  var imageCodeController = BehaviorSubject<File>();

  Function(int) get updateCarBrandId => carBrandId.sink.add;

  Function(int) get updateCarModel => carModelId.sink.add;

  Function(int) get updateCarYear => carYear.sink.add;

  Stream<int> get carBrandStream => carBrandId.stream.transform(selectedId);

  Stream<int> get carModelStream => carModelId.stream.transform(selectedId);

  Stream<int> get carYearStream => carYear.stream.transform(selectedId);

  Function(File) get imageChanged => imageCodeController.sink.add;

  Stream<File> get image => imageCodeController.stream.asBroadcastStream();

  Stream<bool> get submitChanged => Rx.combineLatest3(
      carBrandStream, carModelStream, carYearStream, (a, b, c) => true);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    var mSharedPreferenceManager = SharedPreferenceManager();

    if (event is Click) {
      yield Loading(null);

      var token =
          await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      EmptyModel response = await UserDataRepo.addCarRequest(
          AddCarRequest(
              car_brand_id: carBrandId.value,
              car_brand_model_id: carModelId.value,
              year: carYear.value,
          image: imageCodeController.value), token);

      if(response.field ==""){
        NamedNavigatorImpl().pop();
        NamedNavigatorImpl().pop(result: true);
        imageCodeController.value = null;
        imageCodeController = BehaviorSubject<File>();
        carBrandId.value = null;
        carBrandId = BehaviorSubject<int>();
     carModelId.value = null;
        carModelId = BehaviorSubject<int>();
     carYear.value = null;
        carYear = BehaviorSubject<int>();
      }
      else {
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
    carBrandId.close();
    carModelId.close();
    carYear.close();
  }
}

final addCarBloc = AddCarBloc();
