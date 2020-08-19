
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/cars_repos.dart';

class GetAccessoriesBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield (Start(null));
      var model =  await CarsRepos.accessories(
        await preferencesManager.readString(CachingKey.AUTH_TOKEN)
      );
      yield Done(model);
    }
  }
}

final getAccessoriesBloC = GetAccessoriesBloC();
