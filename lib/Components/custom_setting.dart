import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomSetting extends StatelessWidget {
  final Function onTap;
  final mainText ;
  final subText ;
  final icon ;
  final iconsColor ;
  final bgIconColor;

  const CustomSetting({Key key, this.onTap, this.mainText, this.subText, this.icon, this.iconsColor, this.bgIconColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                         //   Icon(Icons.arrow_back , color: Colors.black,),
                            Text(subText,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "cairo")),
                          ],
                        ),
                        Text(
                          mainText,
                          style: TextStyle(
                              fontSize: 16, fontFamily: "cairo"),
                        ),
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    icon,
                    color: iconsColor,
                  ),
                ),
                color: bgIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
