import 'package:flutter/material.dart';
import 'package:skroot/navigator/named-navigator.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/widgets/custom_app_bar_bg.dart';
import 'package:skroot/ui/main/widgets/custom_flitter.dart';
import 'widgets/product_card.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
        backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: height*.15 , bottom: 10,),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: height,
                    width: width,
                    child: GridView.count(
                      primary: true,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      childAspectRatio: 1,
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(
                            onTap: (){
                              NamedNavigatorImpl().push(Routes.PRODUCT_DETAILS);
                            },
                          ),
                        );
                      }),
                    ),
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
