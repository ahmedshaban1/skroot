
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/network/repos/cars_repos.dart';

class GetProductsBloC extends Bloc<AppEvent, AppState> with Validator {
  final brandIdController = BehaviorSubject<int>();
  final modelIdController = BehaviorSubject<int>();
  final catIdController = BehaviorSubject<int>();
  final yearController = BehaviorSubject<int>();

  Function(int) get brandIdChanged => brandIdController.sink.add;
  Function(int) get modelIdChanged => modelIdController.sink.add;
  Function(int) get catIdChanged => catIdController.sink.add;
  Function(int) get yearChanged => yearController.sink.add;

  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield (Start(null));
      var model =  await CarsRepos.products(
        await preferencesManager.readString(CachingKey.AUTH_TOKEN),
        carBrandId: brandIdController.value ,
        catId: catIdController.value,
        carModelId: modelIdController.value,
        year: yearController.value
      );
      yield Done(model);
    }
  }

  void dispose(){
    modelIdController.close();
    yearController.close();
    brandIdController.close();
    catIdController.close();
  }
}

final getProductsBloC = GetProductsBloC();
