import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skroot/Components/custom_bottom_sheet.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/models/report_problem/problem_types_response.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
import 'package:skroot/ui/main/account/report_problem/problem_types_bloc.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';

class ReportProblemPage extends StatefulWidget {
  @override
  _ReportProblemPageState createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  @override
  void initState() {
    problemTypesBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: height * .15,
            bottom: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: <Widget>[
              BlocBuilder(
                bloc: problemTypesBloc,
                builder: (context, state) {
                  var problemTypes = state.model as ProblemTypesResponse;
                  print("_______ : state is $state");

                  if (state is Done) {
                    List<CountryModel> list = [];
                    for (int i = 0; i < problemTypes.problems.length; i++) {
                      list.add(CountryModel(
                          id: problemTypes.problems[i].id,
                          nameAr: problemTypes.problems[i].label.ar,
                          nameEn: problemTypes.problems[i].label.en));
                    }
                    return StreamBuilder<int>(
                        stream: problemTypesBloc.problemId,
                        builder: (context, snapshot) {
                          return CustomBottomSheet(
                            text: "Problem Type",
                            inputIcon: FontAwesomeIcons.certificate,
                            list: list,
                            onItemClick: (index) {
                              problemTypesBloc.updateId(list[index].id);
                            },
                          );
                        });
                  } else {
                    return CustomBottomSheet(
                        text: "Problem Type",
                        inputIcon: FontAwesomeIcons.certificate,
                        list: [],
                        onItemClick: (index) {});
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<String>(
                    stream: problemTypesBloc.message,
                    builder: (context, snapshot) {
                      return InputFieldArea(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ),
                        hint: AppLocalization.of(context)
                            .getLocalizedText("message"),
                        errorTxt: snapshot.error,
                        changedFunction: problemTypesBloc.updateMessage,
                        textInputType: TextInputType.text,
                        inputFieldWithBorder: false,
                      );
                    }),
              ),
              CustomButton(
                snapshot: true,
                onButtonPress: () {
                  if (problemTypesBloc.messageController.value != null &&
                      problemTypesBloc.problemId.value != null) {
                    problemTypesBloc.add(Click());
                    showLoadingDialog(context);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please Fill All Data",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.purple,
                        fontSize: 16.0);
                  }
                },
                text: AppLocalization.of(context).getLocalizedText("send"),
              ),
            ],
          ),
        ),
        CustomAppBarBg(
          card: false,
          text: "Report Problem",
        ),
      ],
    ));
  }
}
