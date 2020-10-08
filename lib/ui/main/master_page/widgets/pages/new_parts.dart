import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/Components/error_message.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/accessories/accessories_model.dart';
import 'package:skroot/models/cars/brands/car_brands_model.dart';
import 'package:skroot/models/cars/parts/parts_model.dart';
import 'package:skroot/models/cars/products/products_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/brands/get_brand_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/get_brand_model_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/parts/get_parts_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/body_product_model.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/get_products_bloc.dart';
import 'package:skroot/ui/main/master_page/widgets/recently_add_card.dart';

import '../master_title_row.dart';
import 'accessories/accessories_bloc.dart';
class NewParts extends StatefulWidget {
  @override
  _NewPartsState createState() => _NewPartsState();
}

class _NewPartsState extends State<NewParts> {
  @override
  void initState() {
    getBrandsBloC.add(Click());
    getPartsBloC.add(Click());
    getProductsBloC.add(Click());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return BlocBuilder(
      bloc: getBrandsBloC,
      builder: (_,state){
        if(state is Done){
          var brandsModel = state.model as CarBrandResponse ;
          return Container(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    MasterTitleRow(
                      onTap: brandsModel.data.length == 0 ? null :
                      ()=>  NamedNavigatorImpl().push(Routes.BRANDS , arguments: brandsModel.data)
                      ,
                      title: "Shop by brand",
                    ),
                    SizedBox(height: 5,),
                    brandsModel.data.length == 0 ? ErrorMessage(text: "no Date",):Container(
                      alignment: Alignment.center,
                      height: height *.18,
                      width: width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (_, index) =>  Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ContainerCard().containerCard(
                                model : brandsModel.data[index] ,
                                onTap: (){
                                  NamedNavigatorImpl().push(Routes.MODEL , arguments: brandsModel.data[index]);
                                },
                                widget: true,
                                height: height*.18,
                                radius: 10,
                                containerColor: Colors.white,
                                width : width),
                          )),
                    ),
                    SizedBox(height: 10,),
                    MasterTitleRow(
                      onTap: (){
                        NamedNavigatorImpl().push(Routes.PARTS , arguments:
                        BodyProductModel(
                          carBrandModelId: null,
                          carBrandId: null,
                          carPartId: null
                        ));
                      },
                      title: "Shop by Category",
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: height *.18,
                      width: width,
                      child: BlocBuilder(
                        bloc:getPartsBloC,
                        builder: (_, state) {
                          if(state is Done){
                            var model = state.model as PartsCategoriesResponse ;
                            return model.data.length == 0 ?  ErrorMessage(text: "no Date",) : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (_, index) =>  Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: ContainerCard().containerCard(
                                      model: model.data[index],
                                      onTap: (){
                                        NamedNavigatorImpl().push(Routes.PRODUCT ,arguments:
                                        BodyProductModel(carPartId: model.data[index].id));
                                      },
                                      widget: true,
                                      height: height*.18,
                                      radius: 10,
                                      containerColor: Colors.white,
                                      width : width),
                                ));

                          }
                          return Container();
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    MasterTitleRow(
                      onTap: null,
                      title: "Recently added",
                    ),
                    BlocBuilder(
                      bloc: getProductsBloC,
                      builder: (_,state){
                        if(state is Done){
                          var model = state.model as ProductsModel ;
                          return model.data.length == 0 ?  ErrorMessage(text: "no Date",): ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: model.data.length,
                              itemBuilder: (_, index) =>  RecentlyAddCard(
                                  onTap : (){
                                    NamedNavigatorImpl().push(Routes.PRODUCT_DETAILS , arguments: model.data[index]);
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
                  ],
                ),
              ],
            ),
          ) ;
        }
        return Center(
            child: Container(
              padding: EdgeInsets.only(top: height*.2),
                child: AppLoader())
        );
      },
    );
  }
}
