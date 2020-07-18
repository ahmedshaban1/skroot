import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Function onPressSignIn;
  final String buttonText;
  final IconData iconData;
  final Color btnColor;
  final Color txtColor;
  final Color iColor;
  final double btnWidth;
  final double textSize;
  final double btnHeight;

  SignInButton(
      {this.onPressSignIn,
      this.buttonText,
      this.iconData,
      this.btnColor,
      this.iColor,
      this.txtColor,
      this.btnHeight,
      this.btnWidth, this.textSize});

  @override
  Widget build(BuildContext context) {
    if (iconData == null) {
      return InkWell(
        onTap: onPressSignIn,
        child: Container(
            width: btnWidth,
            height: btnHeight,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor]),
                borderRadius: new BorderRadius.circular(5.0),
           ),
            child: MaterialButton(
              onPressed: onPressSignIn,
              child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'cairo',
                  color: txtColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      );
    } else
      return InkWell(
        onTap: onPressSignIn,
        child: Container(
            width: btnWidth,
            height: btnHeight,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: btnColor != null ?[btnColor , btnColor] :[Theme.of(context).primaryColor, Theme.of(context).accentColor]),
                borderRadius: new BorderRadius.circular(5.0),
                ),
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: onPressSignIn,
                      elevation: 2,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontFamily: 'cairo',
                          color: txtColor,
                          fontSize: textSize != null ? textSize :16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    Icon(
                      iconData,
                      color: iColor,
                    )
                  ],
                )
              ],
            )),
      );
  }
}
