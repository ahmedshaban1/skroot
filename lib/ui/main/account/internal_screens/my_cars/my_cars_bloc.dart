import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/network/repos/user_reps.dart';

class MyCarsBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);
  final carId = BehaviorSubject<int>();

  Function(int) get updateCarId => carId.sink.add;

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

    if(event is Delete){
      yield(Loading(null));
      var token =await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      EmptyModel emptyModel = await UserDataRepo.deleteCar(token, carId.value);
      if(emptyModel.message == ""){
        add(Hydrate());
      }
    }
  }
  dispose(){
    carId.close();
  }


}


final myCarsBloc = MyCarsBloc();
