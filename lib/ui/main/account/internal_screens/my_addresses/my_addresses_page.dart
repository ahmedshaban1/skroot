import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/models/requests/authed_user/my_addresses.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/components/my_addresses_view.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/my_addresses_bloc.dart';

class MyAddressesPage extends StatefulWidget {
  @override
  _MyAddressesPageState createState() => _MyAddressesPageState();
}

class _MyAddressesPageState extends State<MyAddressesPage> {
  @override
  void initState() {
    myAddressesBloc.add(Hydrate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(lightThemeColors["surface-dim"]),
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Addresses"),
      ),
      floatingActionButton: RaisedButton(
        onPressed: () async {
          var result =
              await NamedNavigatorImpl().push(Routes.ADD_ADDRESS_ROUTER);
          if (result == true) {
            myAddressesBloc.add(Hydrate());
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
              var result =await NamedNavigatorImpl().push(Routes.EDIT_ADDRESSES_ROUTER , arguments: EditAddressArguments(
                street: data.data[index].street,
                phone: data.data[index].phone,
                title: data.data[index].title,
                cityId: data.data[index].city.id,
                countryId: data.data[index].country.id,
                cityName: data.data[index].city.name.en,
                countryName: data.data[index].country.name.en,
                zipCode: data.data[index].zipCode,
                addressId: data.data[index].id
              ));
              if(result == true){
                myAddressesBloc.add(Hydrate());
              }
            },
            onDeleteClick: (int id){
              myAddressesBloc.updateAddressId(id);
              myAddressesBloc.add(Delete());
            },
          );
        },
      ),
    );
  }
}
