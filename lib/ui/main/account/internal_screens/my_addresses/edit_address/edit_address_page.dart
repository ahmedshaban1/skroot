
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
import 'package:skroot/models/requests/authed_user/my_addresses.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
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
import 'package:skroot/ui/main/account/internal_screens/my_addresses/edit_address/edit_address_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/add_car/add_car_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/get_brand_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/get_brand_model_bloc.dart';

class EditAddressPage extends StatefulWidget {
  final EditAddressArguments editAddressArguments;

  const EditAddressPage({Key key, this.editAddressArguments}) : super(key: key);
  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {

  TextEditingController titleController;
  TextEditingController streetController;
  TextEditingController phoneController;
  TextEditingController zipController;

  @override
  void initState() {

    titleController = TextEditingController(text: widget.editAddressArguments.title);
    streetController = TextEditingController(text: widget.editAddressArguments.street);
    phoneController = TextEditingController(text: widget.editAddressArguments.phone);
    zipController = TextEditingController(text: widget.editAddressArguments.zipCode.toString());
    editAddressBloc.updateAddressId(widget.editAddressArguments.addressId);
    editAddressBloc.updatePhoneNumber(widget.editAddressArguments.phone );
    editAddressBloc.updateStreet(widget.editAddressArguments.street);
    editAddressBloc.updateTitle(widget.editAddressArguments.title);
    editAddressBloc.updateCityId(widget.editAddressArguments.cityId);
    editAddressBloc.updateCountryId(widget.editAddressArguments.countryId);
    editAddressBloc.updateZipCode(widget.editAddressArguments.zipCode);
      countriesBloc.add(Hydrate());
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
        backgroundColor: Color(lightThemeColors["surface-dim"]),

        appBar: AppBar(
          title: Text("Edit Address"),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: editAddressBloc.titleStream,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.subtitles,
                          color: Colors.white,
                        ),
                      ),
                      controller: titleController,
                      errorTxt: snapshot.error,
                      changedFunction: editAddressBloc.updateTitle,
                      textInputType: TextInputType.text,
                      inputFieldWithBorder: false,

                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: editAddressBloc.streetStream,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.streetview,
                          color: Colors.white,
                        ),
                      ),
                      hint: "Street",
                      controller: streetController,
                      errorTxt: snapshot.error,
                      changedFunction: editAddressBloc.updateStreet,
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
                      stream: editAddressBloc.countryIdStream,
                      builder: (context, snapshot) {
                        return CustomBottomSheet(
                          text: widget.editAddressArguments.countryName,
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: list,
                          onItemClick: (index) {
                            editAddressBloc.updateCountryId(list[index].id);
                            citiesBloc.updateCountryId(list[index].id);
                            citiesBloc.add(Click());
                          },
                        );
                      });
                } else {
                  return CustomBottomSheet(
                      text: widget.editAddressArguments.countryName,
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: [],
                      onItemClick: (index) {});
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder(
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
                              stream: editAddressBloc.cityIdStream,
                              builder: (context, snapshot) {
                                return CustomBottomSheet(
                                  text: widget.editAddressArguments.cityName,
                                  inputIcon: FontAwesomeIcons.globeAfrica,
                                  list: list,
                                  onItemClick: (index) {
                                    editAddressBloc.updateCityId(list[index].id);
                                  },
                                );
                              });
                        } else {
                          return CustomBottomSheet(
                              text: widget.editAddressArguments.cityName,
                              inputIcon: FontAwesomeIcons.globeAfrica,
                              list: [],
                              onItemClick: (index) {});
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<int>(
                        stream: editAddressBloc.zipCode,
                        builder: (context, snapshot) {
                          return InputFieldArea(
                            icon: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.local_post_office,
                                color: Colors.white,
                              ),
                            ),
                            hint: "ZIP Code",
                            controller: zipController,
                            errorTxt: snapshot.error,
                            changedFunction: (data) {
                              editAddressBloc.updateZipCode(int.parse(data));
                            },
                            textInputType: TextInputType.number,
                            inputFieldWithBorder: false,
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<String>(
                  stream: editAddressBloc.phoneNumberStream,
                  builder: (context, snapshot) {
                    return InputFieldArea(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                      hint: "Phone Number",
                      controller: phoneController,
                      errorTxt: snapshot.error,
                      changedFunction: editAddressBloc.updatePhoneNumber,
                      textInputType: TextInputType.phone,
                      inputFieldWithBorder: false,
                    );
                  }),
            ),
            StreamBuilder<bool>(
                stream: editAddressBloc.submitChanged,
                builder: (context, snapshot) {
                  return CustomButton(
                    onButtonPress: () {
                      if(snapshot.hasData){
                        editAddressBloc.add(Click());
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
                    text: "Edit Address",
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
