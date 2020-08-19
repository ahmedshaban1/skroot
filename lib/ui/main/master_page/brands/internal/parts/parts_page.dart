import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/Components/error_message.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/app/appEvent.dart';
import 'package:skroot/app/appState.dart';
import 'package:skroot/models/cars/parts/parts_model.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/common/loader.component.dart';
import 'package:skroot/ui/main/master_page/brands/internal/products/body_product_model.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';

import 'get_parts_bloc.dart';
class PartsPage extends StatefulWidget {
  final BodyProductModel model ;

  const PartsPage({Key key, this.model}) : super(key: key);
  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  @override
  void initState() {
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
            ImageBG(),
            Container(
              padding: EdgeInsets.only(top: height*.1 , bottom: 10,),
              child:  BlocBuilder(
                bloc:getPartsBloC,
                builder: (_, state) {
                  if(state is Done){
                    var model = state.model as PartsCategoriesResponse ;
                    return model.data.length == 0 ?  ErrorMessage(text: "no data",) :ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          child: GridView.count(
                            primary: true,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            childAspectRatio: 1,
                            children: List.generate(model.data.length, (index) {
                              return ContainerCard().containerCard(
                                  model: model.data[index],
                                  onTap: (){

                                      NamedNavigatorImpl().push(Routes.PRODUCT ,
                                          arguments: BodyProductModel(
                                              carPartId: model.data[index].id,
                                              carBrandId: widget.model.carBrandId,
                                              carBrandModelId: widget.model.carBrandModelId

                                          ));


                                  },
                                  widget: true,
                                  height: height*.18,
                                  radius: 10,
                                  containerColor: Colors.white,
                                  width : width);
                            }),
                          ),
                        ),
                      ],
                    );

                  }else{
                    return Center(
                        child: Container(
                            padding: EdgeInsets.only(top: height * .03),
                            child: AppLoader()));
                  }
                },
              ),
            ),
            Column(
              children: <Widget>[
                CustomAppBarBg(
                  text: "Select Your Part",
                ),

              ],
            )
          ],
        ));
  }
}
