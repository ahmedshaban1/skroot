import 'package:flutter/material.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/Components/customAppBar.dart';
import 'package:skroot/Components/image_bg.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';

import 'internal/models/get_brand_model_bloc.dart';
class BrandsPage extends StatefulWidget {
  final models ;

  const BrandsPage({Key key, this.models}) : super(key: key);
  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
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
              child: ListView(
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
                      children: List.generate(widget.models.length, (index) {
                        return ContainerCard().containerCard(
                          onTap: (){
                            NamedNavigatorImpl().push(Routes.MODEL , arguments: widget.models[index]);
                          },
                            model: widget.models[index],
                            widget: true,
                            height: height*.18,
                            radius: 10,
                            containerColor: Colors.white,
                            width : width);
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                CustomAppBarBg(
                  text: "Select Your Brand",
                ),
              ],
            )
          ],
        ));
  }
}
