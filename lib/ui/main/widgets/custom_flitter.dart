import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomFilter extends StatelessWidget {
  final grid ;
  final onTapGrid ;
  final onTapList ;
  final gridColor ;
  final listColor ;

  const CustomFilter({Key key, this.grid, this.onTapGrid, this.onTapList, this.gridColor, this.listColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .05,
      margin: EdgeInsets.only( bottom: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.filter_list,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 5,),
                  Text("Filter" , style: TextStyle(color:Colors.white),)
                ],
              ),
            ),
          ),

          grid ?? false ? Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: onTapList,
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.view_week,
                      size: 20,
                      color: listColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTapGrid,
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.view_module,
                      size: 20,
                      color: gridColor,
                    ),
                  ),
                ),
              ],
            ),
          ) : Container()
        ],
      ),
    );
  }
}
