import 'dart:io';
import 'account_details_bloc.dart';


import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skroot/Components/CustomNetworkImage.dart';
import 'package:skroot/Components/custom_bottom_sheet.dart';
import 'package:skroot/Components/custom_image_picker.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/models/lists/countries_response.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/authentication/sign_up/cities_bloc.dart';
import 'package:skroot/ui/authentication/sign_up/countries_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
import 'package:skroot/ui/main/master_page/get_from_shared_bloc.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';


class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController name;
  TextEditingController email;
  TextEditingController phone;

  addToController() async {
    getFromShared.add(GetShared());
    name = TextEditingController(text: getFromShared.username);
    email = TextEditingController(text: getFromShared.email);
    phone = TextEditingController(text: getFromShared.phone);

  }
  @override
  void initState() {
    countriesBloc.add(Hydrate());
    citiesBloc.updateCountryId(1);
    citiesBloc.add(Click());
    addToController();
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
          width: width,
          height: height,
          padding: EdgeInsets.only(top: 30),
          child: BlocBuilder(
            bloc: getFromShared,
            builder: (_,state){
              if(state is Start){
                return ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String>(
                          stream: accountDetailsBloC.userName,
                          builder: (context, snapshot) {
                            return InputFieldArea(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                              ),
                              controller: name,
                              errorTxt: snapshot.error,
                              changedFunction: accountDetailsBloC.userNameChanged,
                              textInputType: TextInputType.text,
                              inputFieldWithBorder: false,
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                      child: StreamBuilder<String>(
                          stream: accountDetailsBloC.phoneNumber,
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                              child: InputFieldArea(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                ),
                                controller: phone,
                                errorTxt: snapshot.error,
                                changedFunction: accountDetailsBloC.updatePhone,
                                textInputType: TextInputType.number,
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String>(
                          stream: accountDetailsBloC.email,
                          builder: (context, snapshot) {
                            return InputFieldArea(
                              inputFieldWithBorder: false,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                              controller: email,
                              errorTxt: snapshot.error,
                              changedFunction: accountDetailsBloC.emailChanged,
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
                                stream: accountDetailsBloC.country,
                                builder: (context, snapshot) {
                                  return Column(
                                    children: [
                                      CustomBottomSheet(
                                        type: "country",
                                        text: getFromShared.countryName,
                                        inputIcon: FontAwesomeIcons.globeAfrica,
                                        list: countriesResponse.data,
                                        onItemClick: (index) {
                                          citiesBloc.updateCountryId(1);
                                          citiesBloc.add(Click());
                                        },
                                      ),
                                      Visibility(
                                          visible: snapshot.hasError ?? false,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                  snapshot.hasError
                                                      ? snapshot.error
                                                      : "",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  );
                                });
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
                                stream: accountDetailsBloC.city,
                                builder: (context, snapshot) {
                                  return Column(
                                    children: [
                                      CustomBottomSheet(
                                        type: "city",
                                        text: getFromShared.cityName,
                                        inputIcon: FontAwesomeIcons.globeAfrica,
                                        list: countriesResponse.data,
                                        onItemClick: (index) {},
                                      ),
                                      Visibility(
                                          visible: snapshot.hasError ?? false,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                  snapshot.hasError
                                                      ? snapshot.error
                                                      : "",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  );
                                });
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
                          stream: accountDetailsBloC.password,
                          builder: (context, snapshot) {
                            return InputFieldArea(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                              changedFunction: accountDetailsBloC.updatePassword,
                              errorTxt: snapshot.error,
                            );
                          }),
                    ),
                    CustomButton(
                      snapshot: true,
                      onButtonPress: () {
                        accountDetailsBloC.add(Click());
                        accountDetailsBloC.add(UpdatePhoto());
                        showLoadingDialog(context);
                      },
                      text: AppLocalization.of(context).getLocalizedText("update"),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
        Column(
          children: <Widget>[
            CustomAppBarBg(
              card: false,
              text: "My Account",
            ),
          ],
        )
      ],
    ));
  }
}
