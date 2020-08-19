import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/network/repos/user_reps.dart';

class MyAddressesBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);
  final addressId = BehaviorSubject<int>();

  Function(int) get updateAddressId => addressId.sink.add;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading(null);

    var mSharedPreferenceManager = SharedPreferenceManager();

    if (event is Hydrate) {
      print("asdasdasd");
      var token =await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      MyAddressesResponse myAddressesResponse = await UserDataRepo.fetchMyAddressesList(token);
      yield Done(myAddressesResponse);
    }

    if(event is Delete){
      yield(Loading(null));
      var token =await mSharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      EmptyModel emptyModel = await UserDataRepo.deleteAddress(token, addressId.value);
      if(emptyModel.message == ""){
        add(Hydrate());
      }
    }
  }

  dispose(){
    addressId.close();
  }
}

final myAddressesBloc = MyAddressesBloc();
