
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/cars_repos.dart';

class GetBrandModelBloC extends Bloc<AppEvent, AppState> with Validator {
  final modelIdController = BehaviorSubject<int>();

  Function(int) get idChanged => modelIdController.sink.add;

  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield (Start(null));
      print("__________________ ${modelIdController.value}");
      var model =  await CarsRepos.brandsModels(modelIdController.value);
      yield Done(model);
    }
  }

  void dispose(){
    modelIdController.close();
  }
}

final getBrandModelBloC = GetBrandModelBloC();
