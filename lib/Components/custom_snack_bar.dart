import 'package:flutter/material.dart';

class CustomSnackBar{
  void showInSnackBar({String title, BuildContext context ,  GlobalKey<ScaffoldState> scaffoldKey ,String body} ) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor:  Color.fromRGBO(92,188,246, 1.0),
        content: Container(
          width: MediaQuery.of(context).size.width-20,
          height: 50,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Cairo",
                  ),
                ),
              ),
              Text(
                body ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Cairo",
                ),
              )
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

}