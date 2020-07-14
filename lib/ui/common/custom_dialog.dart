import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Function btnAction;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Theme.of(context).cardColor,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.display1.copyWith(fontSize: 18.0),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 20),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .subhead
                          .color
                          .withOpacity(0.6))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 30),
              child: RaisedButton(
                onPressed: btnAction,
                child: Container(
                  padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                  child: Text(
                    buttonText,
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontSize: 18.0, color: Theme.of(context).cardColor),
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
    );
  }
}
