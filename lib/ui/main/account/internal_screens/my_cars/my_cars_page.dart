import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/models/requests/authed_user/my_cars.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/CustomButton.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/components/my_cars_view.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/my_cars_bloc.dart';

class MyCarsPage extends StatefulWidget {
  @override
  _MyCarsPageState createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  @override
  void initState() {
    myCarsBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(lightThemeColors["surface-dim"]),
      appBar: AppBar(
        centerTitle: true,
        title: Text("My cars"),
      ),
      body: Stack(
        children: [
          BlocBuilder(
            bloc: myCarsBloc,
            builder: (context, state) {
              var data = state.model as MyCarsResponse;
              return MyCarsView(
                data: data,
                onEditClick: (int index) async {
                  var result =await NamedNavigatorImpl().push(Routes.EDIT_CAR_ROUTER , arguments: EditCarArguments(
                    data.data[index].carBrand.id,
                    data.data[index].carBrandModel.id,
                    data.data[index].year,
                    data.data[index].carBrand.name.en,
                    data.data[index].carBrandModel.name.en,
                    data.data[index].id
                  ));
                  if(result == true){
                    myCarsBloc.add(Hydrate());
                  }
                  },
                onDeleteClick: (int id){
                  myCarsBloc.updateCarId(id);
                  myCarsBloc.add(Delete());
                },

              );
            },
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  snapshot: true,
                  onButtonPress: () async {
                    var result = await NamedNavigatorImpl().push(Routes.ADD_CAR_TOUTER);
                    if(result == true){
                      myCarsBloc.add(Hydrate());
                    }

                  },
                  text: AppLocalization.of(context).getLocalizedText("add_car"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
