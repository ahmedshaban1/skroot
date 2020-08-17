import 'package:flutter/material.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/master_page/widgets/custom_tap_bar.dart';
import 'package:skroot/ui/main/master_page/widgets/master_title_row.dart';
import 'package:skroot/ui/main/master_page/widgets/recently_add_card.dart';
class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    final width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Color(lightThemeColors["sign-bg"]),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: height*.2 , bottom: 10,),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  CustomTabBar(
                    list: list,
                  ),
                  SizedBox(height: 10,),
                  MasterTitleRow(
                    onTap: null,
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
                        itemCount: 3,
                        itemBuilder: (_, index) =>  Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ContainerCard().containerCard(
                             widget: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Image.asset("assets/images/logo.png", height: 50,),
                                 SizedBox(height: 2,),
                                 Text("From" , style: TextStyle(color: Colors.black87 , fontSize: 10),),
                                 Text("El-Doblomasy" , style: TextStyle(color: Colors.black87 , fontSize: 13),),

                               ],
                             ),
                              height: height*.18,
                              radius: 10,
                              containerColor: Colors.white,
                              width : width),
                        )),
                  ),
                  SizedBox(height: 10,),
                  MasterTitleRow(
                    onTap: null,
                    title: "Shop by Category",
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: height *.18,
                    width: width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (_, index) =>  Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ContainerCard().containerCard(
                              widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/images/logo.png", height: 50,),
                                  SizedBox(height: 2,),
                                  Text("From" , style: TextStyle(color: Colors.black87 , fontSize: 10),),
                                  Text("El-Doblomasy" , style: TextStyle(color: Colors.black87 , fontSize: 13),),

                                ],
                              ),
                              height: height*.18,
                              radius: 10,

                              containerColor: Colors.white,
                              width : width),
                        )),
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
