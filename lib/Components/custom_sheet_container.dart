import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';
class CustomSheetContainer extends StatelessWidget {
  final text ;
  final inputIcon ;
  final onTap;

  const CustomSheetContainer({Key key, this.text, this.inputIcon, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(lightThemeColors['sign-bg'])),
            child: Row(
              children: <Widget>[
                Expanded(
                  child : Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(inputIcon , color: Colors. white,),
                      ) ,
                      SizedBox(width: 8,),
                      Text(text ,style : TextStyle(color :Color(lightThemeColors["sign-text"])))
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_drop_down , color: Colors.white,),
                )
              ],
            ),
        ),
      ),
    );
  }
}
