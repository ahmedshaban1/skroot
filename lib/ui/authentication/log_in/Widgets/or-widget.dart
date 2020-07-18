import 'package:flutter/material.dart';
import 'package:skroot/helpers/localization.dart';
import 'package:skroot/theming/colors.dart';
class Or extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 50,
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(lightThemeColors["sign-text"])) ,
              )
          ),
        ),
        SizedBox(width: 15,),
        Text(AppLocalization.of(context)
            .getLocalizedText("or")),
        SizedBox(width: 15,),
        Container(
          width: 50,
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(lightThemeColors["sign-text"])) ,
              )
          ),
        ),
      ],);
  }
}
