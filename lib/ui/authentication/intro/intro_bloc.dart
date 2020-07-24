import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/lists_repo.dart';

class IntroBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Hydrate) {
    yield Start(null);
    var response =await ListsRepo.fetchIntroList();
    yield Done(response);
    }
  }
}

final introBloc = IntroBloc();
