import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/repos/authentication_repos.dart';

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

      mNamedNavigator.push(Routes.LOGIN_ROUTER , replace: true , clean: true);

//          ? NamedNavigatorImpl().push(Routes.INTRO, replace: true, clean: true)
//          : mNamedNavitugator.push(Routes.HOME_ROUTER,
 //             replace: true, clean: true);
    }
  }
}

final splashBloc = SplashBloc();
