import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/brands/car_brands_model.dart';
import 'package:skroot/models/cars/parts/parts_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/network/repos/lists_repo.dart';
import 'package:skroot/network/repos/user_reps.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/brands/get_brand_bloc.dart';
import 'package:skroot/ui/main/master_page/brands/internal/parts/get_parts_bloc.dart';
import 'package:skroot/ui/main/master_page/widgets/custom_tap_bar.dart';
import 'package:skroot/ui/main/master_page/widgets/master_title_row.dart';
import 'package:skroot/ui/main/master_page/widgets/recently_add_card.dart';
class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  void initState() {
    getBrandsBloC.add(Click());
    getPartsBloC.add(Click());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            Image.asset("assets/images/home_image_bg.png",fit: BoxFit.cover , width:double.infinity,height: 200,),
            Image.asset("assets/images/home_bg.png",fit: BoxFit.cover, width: double.infinity , height: 200,),
            BlocBuilder(
              bloc: getBrandsBloC,
              builder: (_,state){
                if(state is Done){
                  var brandsModel = state.model as CarBrandResponse ;
                  return Container(
                    padding: EdgeInsets.only(top: height*.18 , bottom: 10,),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        CustomTabBar(
                          list: list,
                        ),
                        SizedBox(height: 10,),
                        MasterTitleRow(
                          onTap: (){
                            NamedNavigatorImpl().push(Routes.BRANDS , arguments: brandsModel.data);
                          },
                          title: "Shop by brand",
                        ),
                        SizedBox(height: 5,),
                        Container(
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
                                      NamedNavigatorImpl().push(Routes.MODEL);
                                    },
                                    widget: true,
                                    height: height*.18,
                                    radius: 10,
                                    containerColor: Colors.white,
                                    width : width),
                              )),
                        ),
                        SizedBox(height: 10,),
                        BlocBuilder(
                          bloc:getPartsBloC,
                          builder: (_, state) {
                            if(state is Done){
                              var model = state.model as PartsCategoriesResponse ;
                              return   MasterTitleRow(
                                onTap: (){
                                  NamedNavigatorImpl().push(Routes.PARTS , arguments:  model.data);
                                },
                                title: "Shop by Category",
                              );

                            }
                            return Container();
                          },
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
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: (_, index) =>  Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: ContainerCard().containerCard(
                                        model: model.data[index],
                                          onTap: (){
                                            NamedNavigatorImpl().push(Routes.PRODUCT);
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
                        ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (_, index) =>  RecentlyAddCard())


                      ],
                    ),
                  ) ;
                }
                return Center(
                  child: AppLoader()
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(top: height*.13, bottom: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Container(
                      width:width * .8 ,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(lightThemeColors["sign-bg"])
                      ),
                      child: TextField(
                        onChanged: null,
                        onSubmitted:  null,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: 'cairo'),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                            },
                          ),
                          hintText: "Search on a brand",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.only(
                              top: 15.0, right: 10.0, bottom: 10.0, left: 12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }
  var list = [
    {
      "name": "New parts",
      "containerColor": Color(lightThemeColors["sign-bg"]),
      "txtColor": Colors.white,
    },
    {
      "name": "Used Parts",
      "containerColor": Colors.black87,
      "txtColor": Colors.grey[600],
    },
    {
      "name": "Accessories",
      "containerColor": Colors.black87,
      "txtColor": Colors.grey[600],

    },
  ];
}
