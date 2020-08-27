import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:skroot/Components/custom_back_arrow.dart';
import 'package:skroot/Components/custom_bottom_sheet.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/models/lists/countries_response.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/sign_up/cities_bloc.dart';
import 'package:skroot/ui/authentication/sign_up/cities_bloc.dart';
import 'package:skroot/ui/authentication/sign_up/sign_up_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';

import 'countries_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Color activeColor = Color(lightThemeColors["sign-text"]);
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    countriesBloc.add(Hydrate());

    super.initState();
  }

  final _blank = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blank);
        },
        child:ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/sign_up_image.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalization.of(context)
                      .getLocalizedText("join_us"),
                  style: Theme.of(context).textTheme.title.copyWith(
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Text(
                    AppLocalization.of(context)
                        .getLocalizedText("sign_des"),
                    style: Theme.of(context).textTheme.display1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: signUpBloC.userName,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                      ),
                      hint: AppLocalization.of(context)
                          .getLocalizedText("full_name"),
                      errorTxt: snapshot.error,
                      changedFunction: signUpBloC.userNameChanged,
                      textInputType: TextInputType.text,
                      inputFieldWithBorder: false,

                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: signUpBloC.phoneNumber,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                      child: InputFieldArea(
                        hint: AppLocalization.of(context).getLocalizedText("phone"),
                        suffixIcon: StreamBuilder<String>(
                            stream: signUpBloC.phoneController,
                            builder: (context, snapshot) {
                              return CountryCodePicker(
                                padding: EdgeInsets.all(0.0),
                                textStyle: TextStyle(color: Colors.grey[300]),
                                showFlag: false,
                                onChanged: (code) {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  signUpBloC.countryCodeChanged(code.dialCode);
                                  print("on change ${code.name} ${code.dialCode} ${code.name}");
                                },
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: '+971',
                                favorite: ['+02', 'EG' , '+971',],
                                comparator: (a, b) => b.name.compareTo(a.name),
                                //Get the country information relevant to the initial selection
                                onInit: (code) {
                                  signUpBloC.countryCodeChanged(code.dialCode);
                                  print("on init ${code.name} ${code
                                      .dialCode} ${code.name}");
                                },
                              );
                            }
                        ),
                        errorTxt: snapshot.error,
                        changedFunction: signUpBloC.updatePhone,
                        textInputType: TextInputType.number,
                      ),
                    );

                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: signUpBloC.email,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      inputFieldWithBorder: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      hint: AppLocalization.of(context)
                          .getLocalizedText("email"),
                      errorTxt: snapshot.error,
                      changedFunction: signUpBloC.emailChanged,
                      textInputType: TextInputType.emailAddress,
                    );
                  }),
            ),
            BlocListener<CountriesBloc, AppState>(
              listener: (context, state) {},
              bloc: countriesBloc,
              child: BlocBuilder(
                bloc: countriesBloc,
                builder: (context, state) {
                  var countriesResponse = state.model as CountriesResponse;
                  print("_______ : state is $state");
                  if (state is Done) {
                    return StreamBuilder<int>(
                        stream: signUpBloC.country,
                        builder: (context, snapshot) {
                          return CustomBottomSheet(
                            type: "country",
                            text: AppLocalization.of(context)
                                .getLocalizedText("country"),
                            inputIcon: FontAwesomeIcons.globeAfrica,
                            list: countriesResponse.data,
                            onItemClick: (index) {
                              citiesBloc.updateCountryId(1);
                              citiesBloc.add(Click());
                            },
                          );
                        }
                    );
                  } else {
                    return CustomBottomSheet(
                        type: "country",
                        text: AppLocalization.of(context)
                            .getLocalizedText("country"),
                        inputIcon: FontAwesomeIcons.globeAfrica,
                        list: [],
                        onItemClick: (index) {});
                  }
                },
              ),
            ),
            BlocListener<CitiesBloc, AppState>(
              listener: (context, state) {},
              bloc: citiesBloc,
              child: BlocBuilder(
                bloc: citiesBloc,
                builder: (context, state) {
                  var countriesResponse = state.model as CountriesResponse;
                  print("_______ : state is $state");
                  if (state is Done) {
                    return StreamBuilder<int>(
                        stream: signUpBloC.city,
                        builder: (context, snapshot) {
                          return CustomBottomSheet(
                            type: "city",
                            text: AppLocalization.of(context)
                                .getLocalizedText("city"),
                            inputIcon: FontAwesomeIcons.globeAfrica,
                            list: countriesResponse.data,
                            onItemClick: (index) {},
                          );
                        }
                    );
                  } else {
                    return CustomBottomSheet(
                        type: "city",
                        text: AppLocalization.of(context)
                            .getLocalizedText("city"),
                        inputIcon: FontAwesomeIcons.globeAfrica,
                        list: [],
                        onItemClick: (index) {});
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: signUpBloC.password,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0),
                        child: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                      ),
                      hint: AppLocalization.of(context)
                          .getLocalizedText("password"),
                      textInputType: TextInputType.text,
                      show: true,
                      inputFieldWithBorder: false,
                      changedFunction: signUpBloC.updatePassword,
                      errorTxt: snapshot.error,
                    );
                  }),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (isChecked != false) {
                  setState(() {
                    activeColor =
                        Color(lightThemeColors["sign-text"]);
                    isChecked = false;
                  });
                } else {
                  setState(() {
                    activeColor = Theme.of(context).primaryColor;
                    isChecked = true;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: activeColor,
                        child: Icon(
                          Icons.done,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        AppLocalization.of(context)
                            .getLocalizedText("terms"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(
                                lightThemeColors["sign-text"]),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              snapshot: true,
              onButtonPress: () {
                if(signUpBloC.passwordController.value != null
                || signUpBloC.userNameController.value != null
                || signUpBloC.cityIdController.value !=null
                || signUpBloC.countryIdController.value !=null
                || signUpBloC.emailController.value !=null
                || signUpBloC.phoneController.value !=null
                ){
                  if (isChecked) {
                    signUpBloC.add(Click());
                    showLoadingDialog(context);
                  } else {
                    ErrorDialog(
                        context: context,
                        title: "Please you have to accept the conditions",
                        btnAction: () {
                          Navigator.pop(context);
                        },
                        buttonText: "OK");
                  }
                }else{
                  ErrorDialog(
                      context: context,
                      title: "Please you have to fill all fields",
                      btnAction: () {
                        Navigator.pop(context);
                      },
                      buttonText: "OK");
                }
              },
              text: AppLocalization.of(context).getLocalizedText("create"),
            )

          ],
        ),

      ),
    );
  }
  bool snapshot = false ;
}
