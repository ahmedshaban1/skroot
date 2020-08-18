
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/cars_repos.dart';

class GetBrandsBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield (Start(null));
      var model =  await CarsRepos.carsBrands();
      yield Done(model);
    }
  }
}

final getBrandsBloC = GetBrandsBloC();
