import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  Future<dynamic> showWarningDialog(
      {BuildContext context, String msg, Function btnOnPress}) {
    return AwesomeDialog(
      btnOkColor: Color.fromRGBO(0,150,75, 1.0),
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            body: Center(child: Text(msg)),
            btnOkOnPress: btnOnPress,
            btnOkText: 'موافق')
        .show();
  }

  Future<dynamic> showErrorDialog(
      {BuildContext context, String msg, Function btnOnPress}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            btnOkColor: Color.fromRGBO(0,150,75, 1.0),
            dialogType: DialogType.ERROR,
            body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
              msg,
              style: TextStyle(fontFamily: "cairo"),
                        textAlign: TextAlign.center,
            ),
                    ],
                  ),
                )),
            btnOkOnPress: btnOnPress,
            btnOkText: 'موافق')
        .show();
  }

  Future<dynamic> showSuccessDialog(
      {BuildContext context, String msg, String btnMsg, Function btnOnPress}) {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            body: Center(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "cairo",
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            btnOkOnPress: btnOnPress,
            btnOkColor:  Color.fromRGBO(0,150,75, 1.0),
            btnOkText: btnMsg)
        .show();
  }

  Future<dynamic> showOptionDialog(
      {BuildContext context,
      String msg,
      String okMsg,
      Function okFun,
      String cancelMsg,
      Function cancelFun}) {
    return AwesomeDialog(
            context: context,
            btnOkColor: Color.fromRGBO(0,150,75, 1.0),
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            body: Center(child: Text(msg , textAlign: TextAlign.center,)),
            btnOkOnPress: okFun,
            btnOkText: okMsg,
            btnCancelOnPress: cancelFun,
            btnCancelText: cancelMsg)
        .show();
  }

  Future<dynamic> showWidgetDialog({
    BuildContext context,
    String okMsg,
    Function okFun,
    Widget body,
  }) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      btnOkColor:  Color.fromRGBO(0,150,75, 1.0),
      dialogType: DialogType.INFO,
      body: body,
      btnOkOnPress: okFun,
      btnOkText: okMsg,
    ).show();
  }
}
