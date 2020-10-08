import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:skroot/theming/colors.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;

  final icon;

  final String labelTxt;

  final suffixIcon;

  final TextEditingController controller;

  final TextInputType textInputType;

  final Function changedFunction;

  final String errorTxt;

  final bool show;

  final Function iconChanged;

  final bool inputFieldWithBorder;

  final bool border;

  final inputScopeSur;

  final onFocus;


  final inputScopeDes;

  InputFieldArea(
      {this.hint,
      this.icon,
      this.controller,
      this.textInputType,
      this.changedFunction,
      this.errorTxt,
      this.show,
      this.iconChanged,
      this.inputFieldWithBorder,
      this.inputScopeSur,
      this.inputScopeDes,
      this.suffixIcon,
      this.labelTxt,
      this.border,
      this.onFocus});

  @override
  Widget build(BuildContext context) {
    return show != null
        ?  Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(lightThemeColors['sign-bg'])),
                child: Theme(
                  data: ThemeData(primaryColor: Color(lightThemeColors['sign-bg'])),
                  child: TextField(
                    autofocus: false,
                    focusNode: inputScopeSur,
                    keyboardType: textInputType,
                    onChanged: changedFunction,
                    controller: controller,
                    style:  TextStyle(
                        color: Color(lightThemeColors["sign-text"]), fontFamily: 'cairo'),
                    obscureText: show,
                    decoration: InputDecoration(
                      fillColor:  Color(lightThemeColors['sign-bg']),
                      errorText: errorTxt,
                      border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: hint,
                      icon: icon,
                      prefixIcon: suffixIcon,
                      hintStyle: const TextStyle(
                          color: Color(0xff707070),
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                      contentPadding: const EdgeInsets.only(
                          top: 13.0, right: 5.0, bottom: 13.0, left: 10.0),
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(lightThemeColors['sign-bg'])),
                child: Theme(
                  data: ThemeData(
                      primaryColor: Color(lightThemeColors['sign-bg']),
                  ),
                  child: TextField(
                    autofocus: false,
                    controller: controller,
                    focusNode: inputScopeSur,
                    keyboardType: textInputType,
                    onChanged: changedFunction,

                    style: const TextStyle(
                        color:  Color(0xff707070), fontFamily: 'cairo'),
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor:  Color(lightThemeColors['sign-bg']),
                      prefixIcon: suffixIcon,
                      errorText: errorTxt,
                      icon: icon,
                      border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10) ,)),
                       hintText: hint,
                      hintStyle:  TextStyle(
                          color: Color(lightThemeColors["sign-text"]),
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'),
                      contentPadding: const EdgeInsets.only(
                          top: 13.0, right: 5.0, bottom: 13.0, left: 5.0),
                    ),
                  ),
                ),
              );
  }
}
