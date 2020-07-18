import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skroot/theming/colors.dart';

void ErrorDialog(
    {BuildContext context,
    String title,
    String description,
    String buttonText,
    Function btnAction}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
          backgroundColor: Colors.black87,
          elevation: 3,
          contentPadding: EdgeInsets.all(5),
          children: <Widget>[
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Theme.of(context).primaryColor ,fontWeight: FontWeight.bold),
                    ),
//                    Container(
//                      margin: EdgeInsetsDirectional.only(top: 20),
//                      child: Text(description ?? "",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(color: Theme.of(context).primaryColor ,fontWeight: FontWeight.bold),
//                      ),
//                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                      EdgeInsetsDirectional.only(start: 20, end: 20, top: 30),
                      child: RaisedButton(
                        onPressed: btnAction??()=>Navigator.pop(context),
                        child: Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 10, bottom: 10),
                          child: Text(
                            buttonText ?? "OK",
                            style: Theme.of(context).textTheme.display1.copyWith(
                                fontSize: 18.0,
                                color: Colors.black87),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      });
}
