import 'package:flutter/material.dart';

import 'inputTextField.dart';

class CustomSimpleDialog extends StatefulWidget {
  final String headTxt;

  final Color headTxtColor;

  final Color buttonColor;

  final Color buttonTxtColor;

  final String buttonTxt;

  final Function function;

  final Function changedFunction;

  final String errorTxt;
  final String subHeadText;

  bool stateOfDialog;

  CustomSimpleDialog(
      {Key key,
      this.headTxt,
      this.headTxtColor,
      this.buttonColor,
      this.buttonTxtColor,
      this.buttonTxt,
      this.function,
      this.stateOfDialog,
      this.subHeadText,
      this.changedFunction,
      this.errorTxt})
      : super(key: key);

  @override
  _CustomSimpleDialogState createState() => _CustomSimpleDialogState();
}

class _CustomSimpleDialogState extends State<CustomSimpleDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.stateOfDialog == null) {
      setState(() {
        widget.stateOfDialog = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.buttonTxt != null
        ? widget.stateOfDialog
            ? SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
                backgroundColor: Colors.white,
                elevation: 3,
                contentPadding: EdgeInsets.all(5),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.headTxt}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: widget.headTxtColor,
                          fontFamily: 'cairo',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.subHeadText == null ? "" : '${widget.subHeadText}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.headTxtColor,
                        fontFamily: 'cairo',
                        fontSize: 15),
                  ),

                  SizedBox(
                    height: 20,
                  ),
//                  CountryCodePicker(
//                    onChanged: (code) =>
//                        print("on init ${code.name} ${code.dialCode} ${code.name}"),
//                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                    initialSelection: '+966',
//                    favorite: ['+02', 'EG' , '+966' ,],
//                    comparator: (a, b) => b.name.compareTo(a.name),
//                    //Get the country information relevant to the initial selection
//                    onInit: (code) =>
//                        print("on init ${code.name} ${code.dialCode} ${code.name}"),
//                  ),

                  Container(
                    width: MediaQuery.of(context).size.width-100,
                    child: InputFieldArea(
                      hint: 'ادخل رقم الهاتف',
                      textInputType: TextInputType.number,
                      errorTxt: widget.errorTxt,
                      changedFunction: widget.changedFunction,
                      inputFieldWithBorder: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: MaterialButton(
                      onPressed: widget.function,
                      elevation: 3,
                      height: 45,
                      color: widget.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget.buttonTxt,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'cairo',
                            color: widget.buttonTxtColor),
                      ),
                    ),
                  ),
                ],
              )
            : SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                elevation: 3,
                contentPadding: EdgeInsets.all(5),
                children: <Widget>[
                    Text(
                      widget.headTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: widget.headTxtColor,
                          fontFamily: 'cairo',
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: MaterialButton(
                        onPressed: widget.function,
                        elevation: 3,
                        height: 45,
                        color: widget.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.buttonTxt,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'cairo',
                              color: widget.buttonTxtColor),
                        ),
                      ),
                    ),
                  ])
        : SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            elevation: 3,
            contentPadding: EdgeInsets.all(5),
            children: <Widget>[
                Text(
                  widget.headTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.headTxtColor,
                      fontFamily: 'cairo',
                      fontSize: 20),
                )
              ]);
  }
}
