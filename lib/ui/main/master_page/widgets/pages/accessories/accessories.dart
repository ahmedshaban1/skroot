
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/error_message.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/accessories/accessories_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/widgets/pages/accessories/accessories_bloc.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';

import '../../recently_add_card.dart';
class Accessories extends StatefulWidget {
  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {

  Color gridColor = Colors.grey;
  Color listColor = Color(lightThemeColors["primary"]);
  bool grid = false ;
  bool list = true ;
  @override
  void initState() {
   getAccessoriesBloC.add(Click());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return  Column(
      children: <Widget>[
        CustomFilter(
          gridColor: gridColor ,
          listColor: listColor,
          onTapGrid: (){
            setState(() {
              gridColor = Theme.of(context).primaryColor ;
              listColor = Colors.grey ;
               grid = true ;
               list = false ;
            });
          },
          onTapList: (){
            setState(() {
              listColor = Theme.of(context).primaryColor ;
              gridColor = Colors.grey ;
              grid = false ;
              list = true ;
            });
          },
        ),
        Visibility(
          visible: list ?? true,
          child: BlocBuilder(
            bloc: getAccessoriesBloC,
            builder: (_,state){
              if(state is Done){
                var model = state.model as AccessoriesModel ;
                return model.data.length == 0 ? ErrorMessage(text: "no data",) :ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.data.length,
                    itemBuilder: (_, index) =>  RecentlyAddCard(
                      onTap : (){
                        NamedNavigatorImpl().push(Routes.PRODUCT_DETAILS , arguments: model.data[index] );
                      },
                      model : model.data[index]
                    )) ;
              }else{
                return Center(
                    child: Container(
                        padding: EdgeInsets.only(top: height*.2),
                        child: AppLoader())
                );
              }
            },
          ),
        ),
//        Visibility(
//          visible: grid ?? true,
//          child: BlocBuilder(
//            bloc: getAccessoriesBloC,
//            builder: (_,state){
//              if(state is Done){
//                var model = state.model as AccessoriesModel ;
//                return model.data.length == 0 ? ErrorMessage(text: "no data",) :
//                GridView.count(
//                  primary: true,
//                  shrinkWrap: true,
//                  physics: ScrollPhysics(),
//                  crossAxisCount: 2,
//                  crossAxisSpacing: 1,
//                  mainAxisSpacing: 1,
//                  childAspectRatio: 1,
//                  children: List.generate(model.data.length, (index) {
//                    return Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: RecentlyAddCard(
//                          onTap : (){
//                            NamedNavigatorImpl().push(Routes.PRODUCT_DETAILS , arguments: model.data[index] );
//                          },
//                          model : model.data[index]
//                      ),
//                    );
//                  }),
//                );
//              }else{
//                return Center(
//                    child: Container(
//                        padding: EdgeInsets.only(top: height*.2),
//                        child: AppLoader())
//                );
//              }
//            },
//          ),
//        ),
      ],
    );
  }
}
