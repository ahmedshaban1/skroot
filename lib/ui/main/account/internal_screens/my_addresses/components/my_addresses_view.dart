import 'package:flutter/material.dart';
import 'package:skroot/models/my_addresses/my_addresses_response.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/account/internal_screens/my_addresses/components/my_address_item.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/components/my_car_item.dart';

class MyAddressesView extends StatelessWidget {
  final MyAddressesResponse data;
  final Function onEditClick;

  const MyAddressesView({Key key, this.data, this.onEditClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data == null ? Center(child: AppLoader(),) : data.data.isEmpty
        ? Center(child: Text("there is no Data"),) : ListView.builder(
        itemCount: data.data.length,
        itemBuilder: (context , index){
          return MyAddressItem(
            title: data.data[index].title,
            address: data.data[index].street,
            onDeleteClick:(){

            } ,
            onEditClick: (){
              onEditClick(index);
            },
          );
    });
  }
}
