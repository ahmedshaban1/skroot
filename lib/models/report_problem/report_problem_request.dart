class ReportProblemRequest {
  int problem_type_id;
  String message;

  ReportProblemRequest(
      {
        this.problem_type_id,
        this.message});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['problem_type_id'] = this.problem_type_id;
    data['message'] = this.message;
    return data;
  }
}
