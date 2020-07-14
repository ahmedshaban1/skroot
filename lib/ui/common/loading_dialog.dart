import 'package:flutter/material.dart';

import 'loader.component.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          content: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.50,
            child: Center(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "Loading...",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      });
}
