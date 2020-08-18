import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/network/repos/user_reps.dart';

class MyCarsBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading(null);

    var mSharedPreferenceManager = SharedPreferenceManager();

    if (event is Hydrate) {
      print("asdasdasd");
      var token =await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      MyCarsResponse myCarsResponse = await UserDataRepo.fetchMyCarsList(token);
      yield Done(myCarsResponse);
    }
  }
}

final myCarsBloc = MyCarsBloc();
