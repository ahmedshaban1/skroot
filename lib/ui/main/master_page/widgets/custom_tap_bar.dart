
import 'package:flutter/material.dart';
import 'package:skroot/Components/container_card.dart';
import 'package:skroot/theming/colors.dart';
import 'package:skroot/ui/main/master_page/widgets/pages/pages_streams.dart';
// ignore: must_be_immutable
class CustomTabBar extends StatefulWidget {
  final list ;
  bool showNewParts ;
  bool showUsedParts ;
  bool showAccessories ;

   CustomTabBar({Key key, this.list, this.showNewParts, this.showUsedParts, this.showAccessories}) : super(key: key);
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
              pagesStreams.usedPartsChanged(false);
              pagesStreams.accessoriesChanged(false);
              pagesStreams.newPartsChanged(true);

            }else if (index == 1){
              pagesStreams.usedPartsChanged(true);
              pagesStreams.accessoriesChanged(false);
              pagesStreams.newPartsChanged(false);
            }else{
              pagesStreams.usedPartsChanged(false);
              pagesStreams.accessoriesChanged(true);
              pagesStreams.newPartsChanged(false);
            }

            print("index is + $index");
            print("new parts is + ${pagesStreams.newParts.value}");
            print("used parts is + ${pagesStreams.usedParts.value}");
            print("accessories is + ${pagesStreams.accessories.value}");
            setState(() {
              widget.list[index]["containerColor"] = Color(lightThemeColors["sign-bg"]);
              widget.list[index]["txtColor"] = Colors.white;
            });
          } , width : width)),
    );
  }



}
