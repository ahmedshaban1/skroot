import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/error_message.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/products/products_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/body_product_model.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/get_products_bloc.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';
import 'widgets/product_card.dart';
class ProductPage extends StatefulWidget {
  final BodyProductModel body ;

  const ProductPage({Key key, this.body}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    print("________________ body ${widget.body.carBrandModelId}");
    print("________________ body ${widget.body.carBrandId}");
    print("________________ body ${widget.body.carPartId}");
    getProductsBloC.modelIdChanged(widget.body.carBrandModelId);
    getProductsBloC.brandIdChanged(widget.body.carBrandId);
    getProductsBloC.catIdChanged(widget.body.carPartId);
    getProductsBloC.yearChanged(widget.body.year);
    getProductsBloC.add(Click());
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
            ImageBG(),
            Container(
              padding: EdgeInsets.only(top: height*.15 , bottom: 10,),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  BlocBuilder(
                    bloc:getProductsBloC ,
                    builder: (_ , state){
                      if(state is Done){
                        var model = state.model as ProductsModel ;
                        return Container(
                          alignment: Alignment.center,
                          width: width,
                          child: model.data.length == 0 ? ErrorMessage(text: "no data",) : GridView.count(
                            primary: true,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 1,
                            children: List.generate(model.data.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCard(
                                  model : model.data[index],
                                  onTap: (){
                                    NamedNavigatorImpl().push(Routes.PRODUCT_DETAILS , arguments: model.data[index]);
                                  },
                                ),
                              );
                            }),
                          ),
                        );
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
            ),
            Column(
              children: <Widget>[
                CustomAppBarBg(
                  text: "Part Name",
                ),
                CustomFilter(),

              ],
            )
          ],
        ));
  }
}
