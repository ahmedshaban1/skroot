import 'package:flutter/material.dart';
import 'package:skroot/models/my_cars/my_cars_response.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/account/internal_screens/my_cars/components/my_car_item.dart';

class MyCarsView extends StatelessWidget {
  final MyCarsResponse data;
  final Function onEditClick;
  final Function onDeleteClick;

  const MyCarsView({Key key, this.data, this.onEditClick, this.onDeleteClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data == null ? Center(child: AppLoader(),) : data.data.isEmpty
        ? Center(child: Text("there is no Data"),) : ListView.builder(
        itemCount: data.data.length,
        itemBuilder: (context , index){
          return MyCarItem(
            image: data.data[index].imageUrl,
            id: data.data[index].id,
            brandName: data.data[index].carBrand.name.en,
            modelName: data.data[index].carBrandModel.name.en,
            year: data.data[index].year.toString(),
            onDeleteClick:(){
          onDeleteClick(data.data[index].id);
            } ,
            onEditClick: (){
              onEditClick(index);
            },
          );
    });
  }
}
