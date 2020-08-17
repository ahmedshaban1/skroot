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
      MyCarsResponse myCarsResponse = await UserDataRepo.fetchMyCarsList(
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzU0MWE0YjM5YTA3ZWRlM2QyMDNhNjA3ZmY5MTNhNDU1NTQzZmMxMTI3NzdjNzVkYWZkM2RhYTNmZDBjZjFiYWY2YzczM2QxYjk3YzBjNjgiLCJpYXQiOjE1OTc1ODg5NDUsIm5iZiI6MTU5NzU4ODk0NSwiZXhwIjoxNjI5MTI0OTQ1LCJzdWIiOiIxNCIsInNjb3BlcyI6W119.nA0jHBmXTn3nJiq1EY6Gn0aapAdLhBF5XBlLzVn2foAmoybA4Upn8ilwLrgni7kQEV7G3S8CXXtQUUnizdSY8K0wekG2KVFVtXfqi_U56ocoQh1R_ocxbZgV7bumBsfyJDc9NhDzraBo_8iDpM0qpqiCDTrRM226bRCTf3O_4zj6dMJQFjDJVDXZ3x_Dl6rAZ7l_3P_tdanPPtPsHddvg-62GaH1h12r3cugypgegJnOOhTxNsp-UqgglAQFOYmpkJCxpXNLQjLkMw4e2k_oAoyfTniqcjGa7r6pnGKbtcYiXqv6SJy321ffTfJ1LVGLGyi0byYxTuYh95OvmdFFhMEdzYSY6BDIM0MR3_36spGeQZ51uMxpH6N_bQivgdmpIiHFErY9pT-_LycN3evqFgJgFMjb1BqbE9Q0m8zOU53ih8Rd300j05oaNv0S76mPgTdGf6bIkiaudvgB9342kVMFBvmbsaDpS3XsGvId2oGBm_ike-l5xNEpVCmjQdJVF7rTOc7ilhZYk7eEIxykVOq4P0ucugYvsP63pnUVlCB4mLQdMnZkkJGfhp-Trx460Vy49RjB2jh5huvNK-yvQkWB5d79onpn7BFOIA8mgqRLLvO-wEev_ALwNIk5yJ2eWr5jeEjIC0ZOfDsXEm_CdqZkO5zXosts5qUdtD3DG48");
      yield Done(myCarsResponse);
    }
  }
}

final myCarsBloc = MyCarsBloc();
