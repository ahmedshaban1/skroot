import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/components/my_addresses_view.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/my_addresses_bloc.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/my_cars_bloc.dart';

class MyAddressesPage extends StatefulWidget {
  @override
  _MyAddressesPageState createState() => _MyAddressesPageState();
}

class _MyAddressesPageState extends State<MyAddressesPage> {
  @override
  void initState() {
    myCarsBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Addresses"),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () async {
          var result = await NamedNavigatorImpl().push(Routes.ADD_CAR_TOUTER);
          if (result == true) {
            myCarsBloc.add(Hydrate());
          }
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.purple,
                Colors.purpleAccent,
                Colors.deepPurple,
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text('Add New Address',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        ),
      ),
      body: BlocBuilder(
        bloc: myAddressesBloc,
        builder: (context, state) {
          var data = state.model as MyAddressesResponse;
          return MyAddressesView(
            data: data,
            onEditClick: (int index) async {
//              var result =await NamedNavigatorImpl().push(Routes.EDIT_CAR_ROUTER , arguments: EditCarArguments(
//                data.data[index].carBrand.id,
//                data.data[index].carBrandModel.id,
//                data.data[index].year,
//                data.data[index].carBrand.name.en,
//                data.data[index].carBrandModel.name.en,
//                data.data[index].id
//              ));
//              if(result == true){
//                myCarsBloc.add(Hydrate());
//              }
            },
          );
        },
      ),
    );
  }
}
