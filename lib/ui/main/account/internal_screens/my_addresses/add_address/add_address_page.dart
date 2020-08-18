
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skroot/Components/custom_bottom_sheet_with_no_types.dart';
import 'package:skroot/Components/inputTextField.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/models/cars/brands/car_brands_model.dart';
import 'package:skroot/models/cars/model/brand_model_response.dart';
import 'package:skroot/models/lists/countries_response.dart';
import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/authentication/sign_up/cities_bloc.dart';
import 'package:skroot/ui/authentication/sign_up/countries_bloc.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/add_address/add_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/add_car/add_car_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/get_brand_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/get_brand_model_bloc.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        NamedNavigatorImpl().pop(result: false);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("add car"),
        ),
        body: ListView(
          children: <Widget>[




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: addAddressBloc.titleStream,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                      ),
                      hint: "full name",
                      errorTxt: snapshot.error,
                      changedFunction: addAddressBloc.updateTitle,
                      textInputType: TextInputType.text,
                      inputFieldWithBorder: false,

                    );
                  }),
            ),

            BlocBuilder(
              bloc: countriesBloc,
              builder: (context, state) {
                var countriesResponse = state.model as CountriesResponse;
                print("_______ : state is $state");

                if (state is Done) {
                  List<CountryModel> list = [];
                  for (int i = 0; i < countriesResponse.data.length; i++) {
                    list.add(CountryModel(
                        id: countriesResponse.data[i].id,
                        nameAr: countriesResponse.data[i].nameAr,
                        nameEn: countriesResponse.data[i].nameEn));
                  }
                  return StreamBuilder<int>(
                      stream: addAddressBloc.countryIdStream,
                      builder: (context, snapshot) {
                        return CustomBottomSheet(
                          text: "Country",
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: list,
                          onItemClick: (index) {
                            addAddressBloc.updateCountryId(list[index].id);
                            citiesBloc.updateCountryId(list[index].id);
                            citiesBloc.add(Click());
                          },
                        );
                      });
                } else {
                  return CustomBottomSheet(
                      text: "Country",
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: [],
                      onItemClick: (index) {});
                }
              },
            ),
            BlocBuilder(
              bloc: citiesBloc,
              builder: (context, state) {
                var countriesResponse = state.model as CountriesResponse;
                print("_______ : state is $state");

                if (state is Done) {
                  List<CountryModel> list = [];
                  for (int i = 0; i < countriesResponse.data.length; i++) {
                    list.add(CountryModel(
                        id: countriesResponse.data[i].id,
                        nameAr: countriesResponse.data[i].nameAr,
                        nameEn: countriesResponse.data[i].nameEn));
                  }
                  return StreamBuilder<int>(
                      stream: addAddressBloc.cityIdStream,
                      builder: (context, snapshot) {
                        return CustomBottomSheet(
                          text: "City",
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: list,
                          onItemClick: (index) {
                            addAddressBloc.updateCityId(list[index].id);
                          },
                        );
                      });
                } else {
                  return CustomBottomSheet(
                      text: "City",
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: [],
                      onItemClick: (index) {});
                }
              },
            ),


            StreamBuilder<bool>(
                stream: addAddressBloc.submitChanged,
                builder: (context, snapshot) {
                  return CustomButton(
                    onButtonPress: () {
                      if(snapshot.hasData){
                        addAddressBloc.add(Click());
                        showLoadingDialog(context);
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
                    text: "Add Car",
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
