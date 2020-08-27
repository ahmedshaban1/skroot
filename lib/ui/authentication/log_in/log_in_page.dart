import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';

import 'Widgets/media_container.dart';
import 'Widgets/or-widget.dart';
import 'log_in_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> form_key = GlobalKey();
  final _blank = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blank);
        },
        child: Form(
          key: form_key,
          child: BlocListener(
            listener: (context, state) {},
            bloc: logInBloc,
            child: BlocBuilder(
                bloc: logInBloc,
                builder: (context, state) {
                  return ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/login_bg.png",
                                  ),
                                  fit: BoxFit.fill)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalization.of(context)
                                    .getLocalizedText("login"),
                                style: Theme.of(context).textTheme.title,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Text(
                                  AppLocalization.of(context)
                                      .getLocalizedText("sub_login"),
                                  style: Theme.of(context).textTheme.display1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<String>(
                            stream: logInBloc.phoneNumber,
                            builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                              child: InputFieldArea(
                                hint: AppLocalization.of(context).getLocalizedText("phone"),
                                suffixIcon: StreamBuilder<String>(
                                    stream: logInBloc.phoneController,
                                    builder: (context, snapshot) {
                                      return CountryCodePicker(
                                        padding: EdgeInsets.all(0.0),
                                        textStyle: TextStyle(color: Colors.grey[300]),
                                        showFlag: false,
                                        onChanged: (code) {
                                          FocusScope.of(context).requestFocus(FocusNode());
                                          logInBloc.countryCodeChanged(code.dialCode);
                                          print("on change ${code.name} ${code.dialCode} ${code.name}");
                                        },
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: '+971',
                                        favorite: ['+02', 'EG' , '+971',],
                                        comparator: (a, b) => b.name.compareTo(a.name),
                                        //Get the country information relevant to the initial selection
                                        onInit: (code) {
                                          logInBloc.countryCodeChanged(code.dialCode);
                                          print("on init ${code.name} ${code
                                              .dialCode} ${code.name}");
                                        },
                                      );
                                    }
                                ),
                                errorTxt: snapshot.error,
                                changedFunction: logInBloc.updatePhone,
                                textInputType: TextInputType.number,
                              ),
                            );

                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<String>(
                            stream: logInBloc.password,
                            builder: (context, snapshot) {
                              return InputFieldArea(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                                  child: Icon(Icons.lock_outline, color: Colors.white,),
                                ),
                                hint: AppLocalization.of(context).getLocalizedText("password"),
                                textInputType: TextInputType.text,
                                show: true,
                                inputFieldWithBorder: false,
                                changedFunction: logInBloc.updatePassword,
                                errorTxt: snapshot.error,
                              );
                            }),
                      ),
                      StreamBuilder<bool>(
                        stream: logInBloc.submitChanged,
                        builder: (context, snapshot) {
                          return CustomButton(
                            onButtonPress: () {
                              print("____________ phone : ${logInBloc.phoneController.value})");
                                logInBloc.add(Click());
                                showLoadingDialog(context);
                            },
                            text: AppLocalization.of(context)
                                .getLocalizedText("cap-login"),
                          );
                        }
                      ),
                      InkWell(
                        onTap: () {
                          NamedNavigatorImpl().push(Routes.ENTER_PHONE , clean:  false , replace:  false , arguments:  "");

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0.0),
                          child: Text(
                            AppLocalization.of(context)
                                .getLocalizedText("forget-password"),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Color(lightThemeColors["sign-text"]),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Or(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MediaContainer(onTap: (){}, photo: "assets/images/google.png",),
                          SizedBox(width: 10,),
                          MediaContainer(onTap: (){}, photo: "assets/images/facebook.png",)
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      InkWell(
                        onTap: () {
                          var mNamedNavigator = NamedNavigatorImpl();
                          mNamedNavigator.push(Routes.SIGNUP_ROUTER,
                              arguments: "", replace: false, clean: false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalization.of(context)
                                .getLocalizedText("don't-have-account"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(lightThemeColors["sign-text"]),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
