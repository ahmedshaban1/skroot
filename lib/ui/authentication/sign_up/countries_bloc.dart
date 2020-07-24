
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/lists/countries_response.dart';
import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/lists_repo.dart';

class CountriesBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);



  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Hydrate) {
      yield (Start(null));
      CountriesResponse countriesResponse =await ListsRepo.fetchCountriesList();
      print("HERE IS PRINT 4");
      yield Done(countriesResponse);
    }
  }

}

final countriesBloc = CountriesBloc();
