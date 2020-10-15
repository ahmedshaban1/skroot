import 'package:skroot/models/report_problem/problem_type_model.dart';
import 'package:skroot/network/network-mappers.dart';

class ProblemTypesResponse extends ListMappable{

  List<ProblemTypeModel> problems ;


  @override
  Mappable fromJsonList(List<dynamic> json) {
    problems =  json.map<ProblemTypeModel>((x) => ProblemTypeModel.fromJson(x)).toList() ;
    return  this ;
  }



}