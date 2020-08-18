import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/master_page/brands/internal/models/widgets/model_card.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';
class ModelPage extends StatefulWidget {
  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
        backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: height*.18,),
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (_, index) =>  ModelCard(
                    onTap: (){
                      NamedNavigatorImpl().push(Routes.PARTS);
                    },
                  )),
            ),
            Column(
              children: <Widget>[
                CustomAppBarBg(
                  text: "BMW",
                ),
                CustomFilter(),
              ],
            )
          ],
        ));
  }
}
