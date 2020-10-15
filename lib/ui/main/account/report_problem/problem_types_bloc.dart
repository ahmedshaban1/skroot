import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/shared_preference_manger.dart';
import 'package:skroot/helpers/vaildator.dart';
import 'package:skroot/models/cars/accessories/accessories_model.dart';
import 'package:skroot/models/cotact_us_request.dart';
import 'package:skroot/models/report_problem/report_problem_request.dart';
import 'package:skroot/models/requests/sign_up/sign_up_request.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/networkUtlis.dart';
import 'package:skroot/network/repos/authentication_repos.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skroot/network/repos/settings_repo.dart';

class ProblemTypesBloc extends Bloc<AppEvent, AppState> with Validator {
  @override
  AppState get initialState => Start(null);

  String msg;


  var messageController = BehaviorSubject<String>();
  var problemId = BehaviorSubject<int>();

  Function(String) get updateMessage=> messageController.sink.add;
  Function(int) get updateId=> problemId.sink.add;

  Stream<String> get message =>
      messageController.stream.transform(noThing);






  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {

    if(event is Hydrate){
      yield Loading(null);
      var response = await SettingsRepo.fetchProblemTypes();
      yield Done(response);
    }
    else {
      yield Loading(null);

      var response = await SettingsRepo.sendProblemRequest(ReportProblemRequest(message: messageController.value , problem_type_id: problemId.value));

      if(response.field==""){
        messageController.value = null;
        messageController = BehaviorSubject<String>();
        problemId.value = null;
        problemId = BehaviorSubject<int>();
        NamedNavigatorImpl().pop();
        NamedNavigatorImpl().pop();

        Fluttertoast.showToast(
            msg: "Your Report Sent Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);
      }
      else {
        NamedNavigatorImpl().pop();
        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            fontSize: 16.0);

      }


    }




  }

  dispose(){
    messageController.close();
}

}

final problemTypesBloc = ProblemTypesBloc();
