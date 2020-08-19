
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skroot/Components/custom_bottom_sheet_with_no_types.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/brands/car_brands_model.dart';
import 'package:skroot/models/cars/model/brand_model_response.dart';
import 'package:skroot/models/lists/country_model.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/common/error_dialog.dart';
import 'package:skroot/ui/common/loading_dialog.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/add_car/add_car_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/get_brand_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/get_brand_model_bloc.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  List<CountryModel> years = [];

  @override
  void initState() {
    // TODO: implement initState
    getBrandsBloC.add(Click());
    for (int i = 0; i < 50; i++) {
      years.add(CountryModel(
          id: DateTime.now().year - i, nameAr: (DateTime.now().year - i).toString(), nameEn: (DateTime.now().year - i).toString()));
    }
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
          title: Text("add car"),
        ),
        body: ListView(
          children: <Widget>[
            BlocBuilder(
              bloc: getBrandsBloC,
              builder: (context, state) {
                var countriesResponse = state.model as CarBrandResponse;
                print("_______ : state is $state");

                if (state is Done) {
                  List<CountryModel> list = [];
                  for (int i = 0; i < countriesResponse.data.length; i++) {
                    list.add(CountryModel(
                        id: countriesResponse.data[i].id,
                        nameAr: countriesResponse.data[i].name.ar,
                        nameEn: countriesResponse.data[i].name.en));
                  }
                  return StreamBuilder<int>(
                      stream: addCarBloc.carBrandStream,
                      builder: (context, snapshot) {
                        return CustomBottomSheet(
                          text: "Car Brand",
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: list,
                          onItemClick: (index) {
                            addCarBloc.updateCarBrandId(list[index].id);
                            getBrandModelBloC.idChanged(list[index].id);
                            getBrandModelBloC.add(Click());
                          },
                        );
                      });
                } else {
                  return CustomBottomSheet(
                      text: "Car Brand",
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: [],
                      onItemClick: (index) {});
                }
              },
            ),
            BlocBuilder(
              bloc: getBrandModelBloC,
              builder: (context, state) {
                var countriesResponse = state.model as BrandsModelResponse;
                print("_______ : state is $state");

                if (state is Done) {
                  List<CountryModel> list = [];
                  for (int i = 0; i < countriesResponse.data.length; i++) {
                    list.add(CountryModel(
                        id: countriesResponse.data[i].id,
                        nameAr: countriesResponse.data[i].name.ar,
                        nameEn: countriesResponse.data[i].name.en));
                  }
                  return StreamBuilder<int>(
                      stream: addCarBloc.carModelStream,
                      builder: (context, snapshot) {
                        return CustomBottomSheet(
                          text: "Car Model",
                          inputIcon: FontAwesomeIcons.globeAfrica,
                          list: list,
                          onItemClick: (index) {
                            addCarBloc.updateCarModel(list[index].id);
                          },
                        );
                      });
                } else {
                  return CustomBottomSheet(
                      text: "Car Model",
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: [],
                      onItemClick: (index) {});
                }
              },
            ),
            StreamBuilder<int>(
                stream: addCarBloc.carYearStream,
                builder: (context, snapshot) {
                  return CustomBottomSheet(
                      text: "Car Year",
                      inputIcon: FontAwesomeIcons.globeAfrica,
                      list: years,
                      onItemClick: (index) {
                        addCarBloc.updateCarYear(years[index].id);
                      });
                }),
            StreamBuilder<bool>(
                stream: addCarBloc.submitChanged,
                builder: (context, snapshot) {
                  return CustomButton(
                    onButtonPress: () {
                      if(snapshot.hasData){
                        addCarBloc.add(Click());
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
