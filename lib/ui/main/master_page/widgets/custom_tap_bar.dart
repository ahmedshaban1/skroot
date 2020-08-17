
import 'package:flutter/material.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/theming/colors.dart';
class CustomTabBar extends StatefulWidget {
  final list ;

  const CustomTabBar({Key key, this.list}) : super(key: key);
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right :15.0 , left :15.0),
      height:  45,
      color: Color(lightThemeColors["sign-bg"]),
      alignment: Alignment.center,
      width: width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (_, index) =>  ContainerCard().containerCard(
              name :widget.list[index]["name"],
              containerColor: widget.list[index]["containerColor"],
              textColor: widget.list[index]["txtColor"],
              onTap: () {
            for (int i = 0; i < widget.list.length; i++) {
              setState(() {
                widget.list[i]["containerColor"] = Colors.black87;
                widget.list[i]["txtColor"] = Colors.grey[700];
              });
            }
            if(index==0){
            }else{
            }
            print("index is + $index");
            setState(() {
              widget.list[index]["containerColor"] = Color(lightThemeColors["sign-bg"]);
              widget.list[index]["txtColor"] = Colors.white;
            });
          } , width : width)),
    );
  }



}
