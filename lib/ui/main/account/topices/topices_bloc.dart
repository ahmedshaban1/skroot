
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/cars_repos.dart';
import 'package:skroot/network/repos/user_reps.dart';

class GetTopicsBloC extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Privacy) {
      yield (Start(null));
      var model =  await UserDataRepo.getPrivacy();
      yield Done(model);
    }else{
      yield (Start(null));
      var model =  await UserDataRepo.getTerms();
      yield Done(model);
    }
  }
}

final getTopicsBloC = GetTopicsBloC();
