import 'dart:core';

import 'package:skroot/models/cotact_us_request.dart';
import 'package:skroot/models/empty_model.dart';
import 'package:skroot/models/report_problem/problem_types_response.dart';
import 'package:skroot/models/report_problem/report_problem_request.dart';
import 'package:skroot/network/networkUtlis.dart';

class SettingsRepo {
  static Future<EmptyModel> contactUs(ContactUsRequest contactUsRequest) {
    Future<EmptyModel> contactUsResponse =
        NetworkUtil.internal().post(EmptyModel(), "help/contact-messages" , body: contactUsRequest);
    print("HERE IS PRINT 2");
    return contactUsResponse;
  }


  static Future<ProblemTypesResponse> fetchProblemTypes(){
    return NetworkUtil.internal().get(ProblemTypesResponse(), "help/problem-types");
  }
  
  
  static Future<EmptyModel> sendProblemRequest(ReportProblemRequest reportProblemRequest){
    return NetworkUtil.internal().post(EmptyModel(), "help/reported-problems" , body: reportProblemRequest);
  }

}
