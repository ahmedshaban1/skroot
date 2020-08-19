import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';

class SplashBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => Start(null);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading(null);

    var mSharedPreferenceManager = SharedPreferenceManager();

    var mNamedNavigator = NamedNavigatorImpl();
    if (event is AnimationEnd) {
      var status = await mSharedPreferenceManager.readBoolean(
          CachingKey.IS_LOGGED_IN);
      print("Status =========>" + status.toString());
      if(status){
        mNamedNavigator.push(Routes.HOME_ROUTER , replace: true , clean: true);

      }
      else {
        mNamedNavigator.push(Routes.LOGIN_ROUTER , replace: true , clean: true);
      }

//      AuthenticationRepo
//          .signUp(SignUpRequest(name: "Jemy",
//          phone: "+971524555806",
//          password: "123456",
//          cityId: "1",
//          countryId: "1",
//          email: "mowagdy2021@gmail.com"))
//          .then((response){
//
//      });


//          ? NamedNavigatorImpl().push(Routes.INTRO, replace: true, clean: true)
//          : mNamedNavitugator.push(Routes.HOME_ROUTER,
 //             replace: true, clean: true);
    }
  }
}

final splashBloc = SplashBloc();
